require 'json'

class HitFoxFeed
  include RedisHelper

  def initialize
    @feed = GithubFeed.new
    @redis = new_redis_client
  end

  def update
    @redis.set 'HitFoxFeed', retrieved_events
  end

  def events
    @redis.get('HitFoxFeed')
  end

  private
  def retrieved_events
    @feed.events.map{ |event| event.json }.to_json
  end
end
