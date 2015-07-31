require 'rails_helper'
require 'pull_request_event'
require 'fakes/pull_request'

RSpec.describe 'PullRequestEvent' do
  let(:fake_pull) { FAKE_PR }
  let(:pull_request) { PullRequestEvent.new fake_pull }

  let(:name) { fake_pull[:actor][:login] }
  it '#name' do
    expect(pull_request.author).to eq fake_pull[:actor][:login]
  end

  let(:branch) { fake_pull[:payload][:pull_request][:title] }
  it '#title' do
    expect(pull_request.branch).to eq branch
  end

  let(:body) { fake_pull[:payload][:pull_request][:body] }
  it '#body' do
    expect(pull_request.body).to eq body
  end

  let(:commits) { fake_pull[:payload][:pull_request][:commits] }
  it '#body' do
    expect(pull_request.commits).to eq commits
  end

  let(:deletions) { fake_pull[:payload][:pull_request][:deletions] }
  it '#body' do
    expect(pull_request.deletions).to eq deletions
  end

  let(:additions) { fake_pull[:payload][:pull_request][:additions] }
  it '#body' do
    expect(pull_request.additions).to eq additions
  end

  let(:changed_files) { fake_pull[:payload][:pull_request][:changed_files] }
  it '#body' do
    expect(pull_request.changed_files).to eq changed_files
  end

  let(:pr_number) { fake_pull[:payload][:pull_request][:number] }
  it '#body' do
    expect(pull_request.pr_number).to eq pr_number
  end
end
