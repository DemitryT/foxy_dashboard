class HackerNewsRepo
  def initialize(hacker_news_uri = 'https://hacker-news.firebaseio.com/v0')
    @client =  Firebase::Client.new hacker_news_uri
    @stories_repo = NewStoryRepo.new @client
  end

  def all
    new_stories_ids.each.map { |story_id| @stories_repo.with(story_id) }
  end

  def new_stories_ids
    @client.get('newstories', print: 'pretty').body
  end
end
