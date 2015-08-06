require 'rails_helper'

describe HackerNewsRepo do
  let(:feed) { HackerNewsRepo.new }

  describe '#news' do
    let(:new_stories_ids) { feed.new_stories_ids }
    it 'calls the new_stories' do
      VCR.use_cassette 'new_stories' do
        expect(new_stories_ids).to be_an_instance_of Array
      end
    end
  end
end
