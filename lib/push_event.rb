require 'github_event'

class PushEvent < GithubEvent
  def branch
    @data[:payload][:ref].split("/").last
  end

  def commit_message
    @data[:payload][:commits].first['message']
  end

  def project
    @data[:repo][:name]
  end
end
