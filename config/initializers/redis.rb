# Location: config/initializers/redis.rb
def set_redis
  conf_file = File.join('config', 'redis.yml')

  if File.exists?(conf_file)
    conf = YAML.load(File.read(conf_file))
    conf[Rails.env.to_s].blank? ? Redis.new : Redis.new(conf[Rails.env.to_s])
  else
    Redis.new
  end
end

$redis = set_redis
