class HackerNewsRepo
  CLIENT = Firebase::Client.new('https://hacker-news.firebaseio.com/v0')
  MAX_ST = 30

  def initialize( client = CLIENT, max_st = MAX_ST)
    @client =  client
    @repo = NewStoryRepo.new client
    @max_st = max_st
  end

  def all
    relevant new_stories_ids.map { |story_id| @repo.story_with story_id }
  end

  private
  def new_stories_ids
    @client.get('newstories', print: 'pretty').body[0,@max_st]
  end

  def relevant(stories)
    stories.select { |story| story != { } }
  end
end
