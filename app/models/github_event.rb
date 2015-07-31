class GithubEvent
  def initialize(json_data = {})
    @data = json_data
  end

  def type
    @data[:type].downcase.to_sym
  end

  def date
    Time.iso8601(@data[:created_at])
  end

  def ago
    sec = (Time.now - date).floor
    if sec < 3600
      sec = sec / 60
      "#{sec} minutes ago"
    elsif sec > 3600 && sec < 86400
      hour = sec / 60 / 60
      "#{hour} hours ago"
    else
      day = sec / 60 / 60 / 24
      "#{day} days ago"
    end
  end

  def timestamp
    Time.iso8601(@data[:created_at])
  end

  def avatar
    @data[:actor][:avatar_url]
  end

  def author
    @data[:actor][:login]
  end

  def repo
    @data[:repo][:name]
  end

  def json
    {
      type: type,
      timestamp: timestamp,
      avatar: avatar,
      ago: ago,
      repo: repo,
      author: author
    }
  end
end
