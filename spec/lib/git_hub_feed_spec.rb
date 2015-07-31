require 'rails_helper'
require 'github_feed'

describe 'GitHubFeed' do
  let(:feed) { GithubFeed.new(ENV['GITHUB_USER'],'HitFox',ENV['GITHUB']) }
  it 'should' do
    VCR.use_cassette 'github_feed' do
      expect(feed.events).to be_an_instance_of Array
    end
  end
end
