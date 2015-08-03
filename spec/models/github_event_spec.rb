require 'rails_helper'

describe 'GithubEvent' do
  let(:fake_push) { FAKE_PUSH }
  let(:github_event) { GithubEvent.new fake_push }

  let(:author) { fake_push[:actor][:login] }
  it '#author' do
    expect(github_event.author).to eq author
  end

  let(:timestamp) { fake_push[:created_at] }
  it '#timestamp' do
    expect(github_event.timestamp).to eq timestamp
  end

  let(:avatar) { fake_push[:actor][:avatar_url] }
  it '#avatar' do
    expect(github_event.avatar).to eq avatar
  end

  let(:type) { :pushevent }
  it '#type' do
    expect(github_event.type).to eq type
  end

  let(:repo) { fake_push[:repo][:name] }
  it '#repo' do
    expect(github_event.repo).to eq repo
  end

  let(:json) { github_event.json }
  it '#json' do
    expect(json).to have_key :type
    expect(json).to have_key :timestamp
    expect(json).to have_key :avatar
    expect(json).to have_key :ago
    expect(json).to have_key :repo
    expect(json).to have_key :author
  end
end
