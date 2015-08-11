require 'rails_helper'

describe 'HitFoxHub' do
  let(:feed) { HitFoxActivity.new }

  it '#events' do
    VCR.use_cassette 'github_feed' do
      feed.update
    end
    expect(feed.events).to be_an_instance_of String
  end
end
