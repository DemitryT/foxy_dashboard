require 'hit_fox_feed'

class HitFoxFeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely.second_of_minute(0, 5, 10, 15, 20, 25) }

  def perform
    feed = HitFoxFeed.new(ENV['GITHUB_USER'],'HitFox',ENV['GITHUB'])

    File.write('app/views/hit_fox_feed/events.json', feed.events)
  end
end
