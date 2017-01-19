class ClientWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(5)
  end

  def perform
    @client_importer ||= ClientImporter.new
    @client_importer.process!
  end
end
