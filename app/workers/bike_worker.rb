class BikeWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(5)
  end

  def perform
    # here will be sql model update instructions
  end
end
