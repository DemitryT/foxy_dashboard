class NewStoryRepo
  CLIENT = Firebase::Client.new 'https://hacker-news.firebaseio.com/v0'

  def initialize( client = CLIENT )
    @client =  client
  end

  def story_with(story_id)
    present story(story_id)
  end

  private
  def story(story_id)
    @client.get("item/#{story_id}", print: 'pretty').body
  end

  def present(story)
    {
      post_title: story['title'],
      score: story['score'],
      comments: story['descendants'],
      author: story['by'],
      timestamp: story['time'],
      link_source: story['url']
    }
  end
end
