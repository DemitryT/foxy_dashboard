class HackerNewsRepo
  def initialize(hacker_news_uri = 'https://hacker-news.firebaseio.com/v0', story_max = 30)
    @client =  Firebase::Client.new hacker_news_uri
    @stories_repo = NewStoryRepo.new @client
    @story_max = story_max
  end

  def all
    new_stories_ids.map { |story_id| NewStoryRepo.new.story_with story_id }
  end

  private
  def new_stories_ids
    @client.get('newstories', print: 'pretty').body[0,@story_max]
  end
end
