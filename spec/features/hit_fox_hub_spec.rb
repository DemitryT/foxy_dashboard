require 'rails_helper'
require 'hit_fox_hub'

describe 'HitFoxHub' do
  let(:token) { ENV['GITHUB'] }
  let(:hub) { HitFoxFeed.new 'nic-lan', 'HitFox', token }

  it 'returns the repo list' do
    VCR.use_cassette 'hit_fox_hub_events' do
      expect(hub.events).to be_success
    end
  end
end
