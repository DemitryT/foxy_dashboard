require 'faraday'

class GithubFeed

  TYPES = %w(PushEvent PullRequestEvent)

  def initialize(user =ENV['GITHUB_USER'], org ='HitFox', token =ENV['GITHUB'])
    @token  = token
    @user   = user
    @org    = org
    @client = Faraday.new(url: 'https://api.github.com/')
  end

  def events
    events = json_get("/users/#{@user}/events/orgs/#{@org}")
    events.map do |event_json|
      event_type = event_json[:type]
      Object.const_get(event_type).new(event_json) if TYPES.include?(event_type)
    end.compact
  end

  private
  def json_get(path)
    response = @client.get(path) do |req|
      req.headers['Authorization'] = "token #{@token}"
    end
    json = JSON.parse(response.body)

    if json.is_a? Array
      json.map {|j| symbolize_keys j}
    elsif json.is_a? Hash
      symbolize_keys json
    else
      raise 'Only Array or Hash'
    end
  end

  def symbolize_keys(hash)
    hash.inject({}){|new_hash, key_value|
      key, value = key_value
      value = symbolize_keys(value) if value.is_a?(Hash)
      new_hash[key.to_sym] = value
      new_hash
    }
  end
end
