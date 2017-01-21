module PubSub
  class << self
    def redis
      redis_connection = Redis.new(
        host: ENV['REDIS_HOST'],
        port: ENV['REDIS_PORT'],
        password: ENV['REDIS_PASSWORD']
      )
      @redis ||= Redis::Namespace.new("sobi-#{Rails.env}", redis: redis_connection)
    end
  end
end
