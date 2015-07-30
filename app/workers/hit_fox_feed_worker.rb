require 'hit_fox_feed'

class HitFoxFeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely.second_of_minute(0, 5, 10, 15, 20, 25) }

  def perform
    HitFoxFeed.new(ENV['GITHUB_USER'],'HitFox',ENV['GITHUB']).update
  end
end
