require 'rails_helper'

describe 'HitFoxHub' do
  let(:feed) { HitFoxActivity.new ENV['GITHUB_USER'], 'HitFox', ENV['GITHUB'] }

  it '#events' do
    VCR.use_cassette 'github_feed' do
      feed.update
    end
    expect(feed.events).to be_an_instance_of Array
  end
end
