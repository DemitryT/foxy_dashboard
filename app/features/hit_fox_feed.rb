require 'github_feed'
require 'yajl'

class HitFoxFeed
  def initialize(user, org, token)
    @feed = GithubFeed.new(user,org, token)
    @redis = $redis
  end

  def update
    @redis.set 'HitFoxFeed', Yajl::Encoder.new.encode(retrieved_events)
  end

  def events
    @redis.get 'HitFoxFeed'
  end

  private
  def retrieved_events
    @feed.events.map do |event|
      {
          commit_sha: event.commit[:sha],
          message:    event.commit[:message],
          author:     event.author[:login],
          url:        event.commit[:url],
          branch:     event.branch,
          avatar_url: event.author[:avatar_url],
          ago:        event.ago,
          title:      event.title
      }
    end
  end
end
