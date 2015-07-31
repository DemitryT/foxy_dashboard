require 'rails_helper'

describe 'GitHubFeed' do
  let(:feed) { GithubFeed.new(ENV['GITHUB_USER'],'HitFox',ENV['GITHUB']) }
  let(:events) { feed.events }
  it '#events' do
    VCR.use_cassette 'github_feed' do
      expect(events.first).to be_an_instance_of PushEvent
    end
  end
end
