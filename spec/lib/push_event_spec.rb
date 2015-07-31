require 'rails_helper'
require 'push_event'
require 'fakes/push_event'

RSpec.describe 'PushEvent' do
  let(:fake_push) { FAKE_PUSH }
  let(:push_event) { PushEvent.new fake_push }

  let(:name) { fake_push[:actor][:login] }
  it '#name' do
    expect(push_event.author).to eq fake_push[:actor][:login]
  end

  let(:commit_message) { fake_push[:payload][:commits].first['message'] }
  it '#commit_message' do
    expect(push_event.commit_message).to eq commit_message
  end

  let(:timestamp) { fake_push[:created_at] }
  it '#timestamp' do
    expect(push_event.timestamp).to eq timestamp
  end

  let(:avatar) { fake_push[:actor][:avatar_url] }
  it '#avatar' do
    expect(push_event.avatar).to eq avatar
  end

  let(:project) { fake_push[:repo][:name] }
  it '#project' do
    expect(push_event.project).to eq project
  end

  let(:branch) { fake_push[:payload][:ref].split("/").last }
  it '#branch' do
    expect(push_event.branch).to eq branch
  end
end
