require 'rails_helper'

describe HackerNewsRepo do
  let(:feed) { HackerNewsRepo.new }

  describe '#all' do
    let(:all) { feed.all }
    it 'calls the new_stories' do
      expect(all.count).to eq 3
    end
  end
end
