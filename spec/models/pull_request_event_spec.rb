require 'rails_helper'

RSpec.describe 'PullRequestEvent' do
  let(:fake_pull) { FAKE_PR }
  let(:pull_request) { PullRequestEvent.new fake_pull }

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

  let(:json) { pull_request.json }
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
    expect(json).to have_key :body
    expect(json).to have_key :commits
    expect(json).to have_key :deletions
    expect(json).to have_key :additions
    expect(json).to have_key :changed_files
    expect(json).to have_key :pr_number
  end
end
