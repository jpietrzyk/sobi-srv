module Communication
  class << self
    def data
      @data ||= Redis::Namespace.new("sobi-#{Rails.env}", redis: Redis.new)
    end
  end
end
