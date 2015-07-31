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

  def json
    super.merge(
      {
        branch: branch,
        commit_message: commit_message,
        project: project
      }
    )
  end
end
