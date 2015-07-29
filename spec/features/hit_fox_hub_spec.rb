require 'rails_helper'
require 'hit_fox_hub'

describe 'HitFoxHub' do
  let(:hub) { HitFoxHub.new }

  it 'returns the repo list' do
    VCR.use_cassette 'nic_lan_repos' do
      expect(hub.repos).to be_success
    end
  end
end
