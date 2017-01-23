module Communication
  class << self
    def data
      redis_connection = Redis.new(
        host: ENV['REDIS_HOST'],
        port: ENV['REDIS_PORT'],
        password: ENV['REDIS_PASSWORD']
      )
      @data ||= Redis::Namespace.new("sobi-#{Rails.env}", redis: redis_connection)
    end
    def data=(redis)
      @data = redis
    end
  end
end
