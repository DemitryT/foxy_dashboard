class HackerNews
  include RedisHelper

  def initialize( repo = HackerNewsRepo.new )
    @repo = repo
    @redis = new_redis_client
  end

  def update
    @redis.set 'HackerNews', @repo.all.to_json
  end

  def stories
    @redis.get 'HackerNews'
  end
end
