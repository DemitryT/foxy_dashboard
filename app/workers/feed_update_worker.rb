class FeedUpdateWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely.second_of_minute (0..60).step(5).to_a }

  def perform
    HitFoxFeed.new.update
  end
end

