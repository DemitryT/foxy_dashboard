require 'rails_helper'

describe HackerNewsRepo do
  let(:api_uri) { 'https://hacker-news.firebaseio.com/v0/' }
  let(:story_id_uri) { 'newstories.json?print=pretty' }
  let(:story_item_uri) { 'item/1.json?print=pretty' }
  let(:item_id ) { 1 }
  let(:item ) { ITEM }
  let(:feed) { HackerNewsRepo.new }

  describe '#all' do
    let(:all) { feed.all }
    it 'calls the new_stories' do
      VCR.turned_off do
        set_stub_request api_uri + story_id_uri, [ item_id ]
        set_stub_request api_uri + story_item_uri, item

        expect(all.count).to eq 1
      end
    end
  end
end
