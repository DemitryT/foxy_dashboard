# require 'functions/symbolize_keys'
require 'github_event'

class PushEvent < GithubEvent
  def author
    @data[:actor]
  end

  def repo
    @data[:repo][:name]
  end

  def commit
    symbolize_keys @data[:payload][:commits].first
  end

  def branch
    @data[:payload][:ref].split("/").last
  end

  def title
    "#{author[:login]} pushed #{branch} at #{repo}"
  end
end
