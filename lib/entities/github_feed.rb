require 'faraday'
require 'functions/symbolize_keys'
require 'entities/push_event'

class GithubFeed

  # Types of events displayed on feed
  EVENT_TYPES = ['PushEvent']

  def initialize(user, org, token)
    @token  = token
    @user   = user
    @org    = org
    @client = Faraday.new(url: 'https://api.github.com/')
  end

  def events
    events = json_get("/users/#{@user}/events/orgs/#{@org}")
    events.map do |event_json|
      event_type = event_json[:type]
      Object.const_get(event_type).new(event_json) if EVENT_TYPES.include?(event_type)
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
end
