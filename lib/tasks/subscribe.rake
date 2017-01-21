namespace :subscribe do
  task clients: :environment do
    PubSub.redis.subscribe('clients') do |on|
      on.message do |channel, message|
        Rails.logger.info("Broadcast on channel #{channel}: #{message}")
        ClientSubscriber.new(message).process!
      end
    end
  end
end
