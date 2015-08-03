require 'rails_helper'

RSpec.describe 'PushEvent' do
  let(:fake_push) { FAKE_PUSH }
  let(:push_event) { PushEvent.new fake_push }

  let(:commit_message) { fake_push[:payload][:commits].first['message'] }
  it '#commit_message' do
    expect(push_event.commit_message).to eq commit_message
  end

  let(:branch) { fake_push[:payload][:ref].split("/").last }
  it '#branch' do
    expect(push_event.branch).to eq branch
  end

  let(:json) { push_event.json }
  it '#json' do
    # super related keys
    expect(json).to have_key :type
    expect(json).to have_key :timestamp
    expect(json).to have_key :avatar
    expect(json).to have_key :ago
    expect(json).to have_key :repo
    expect(json).to have_key :author

    # class related
    expect(json).to have_key :branch
    expect(json).to have_key :commit_message
  end
end
