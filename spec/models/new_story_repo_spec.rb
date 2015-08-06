require 'rails_helper'

describe NewStoryRepo do
  let(:client) { Firebase::Client.new 'https://hacker-news.firebaseio.com/v0' }
  let(:repo) { NewStoryRepo.new client }
  let(:story_id) { 10016624 }
  let(:story) { repo.story_with story_id }

  describe '#story_with'do
    it 'returns a Hash' do
      VCR.use_cassette 'story_item' do
        expect(story).to be_an_instance_of Hash
      end
    end

    it 'post_title key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'post_title'
        expect(story['post_title']).to eq 'A curated list of data science blogs'
      end
    end

    it 'score key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'score'
        expect(story['score']).to eq 56
      end
    end

    it 'comments key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'comments'
        expect(story['comments']).to eq 11
      end
    end

    it 'author key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'author'
        expect(story['author']).to eq 'istinspring'
      end
    end

    it 'timestamp key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'timestamp'
        expect(story['timestamp']).to eq 1438871096
      end
    end

    let(:resource_link) { 'https://github.com/rushter/data-science-blogs' }
    it 'link_source key' do
      VCR.use_cassette 'story_item' do
        expect(story).to have_key 'link_source'
        expect(story['link_source']).to eq resource_link
      end
    end
  end
end
