class HackerNewsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely.second_of_minute (0..60).step(30).to_a }

  def perform
    HackerNews.new.update
  end
end
