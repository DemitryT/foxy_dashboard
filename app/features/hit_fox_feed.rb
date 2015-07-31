require 'json'

class HitFoxFeed
  def initialize(user, org, token)
    @feed = GithubFeed.new(user, org, token)
    @redis = $redis
  end

  def update
    @redis.set 'HitFoxFeed', json
  end

  def events
    @redis.get('HitFoxFeed').to_json
  end

  private
  def json
    @feed.events.map { |event| event.json }
  end
end
