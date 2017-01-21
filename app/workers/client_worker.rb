class ClientWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(5)
  end

  def perform
    importer.process!
  end

  def importer
    @importer ||= ClientImporter.new
  end
end
