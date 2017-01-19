class ClientWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(5)
  end

  def perform
    Client.import_clients_data!
  end
end
