require 'entities/github_feed'
require 'jbuilder'

class HitFoxFeed
  def initialize(user,org,token)

    @feed = GithubFeed.new(user,org, token)
  end

  def events
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
