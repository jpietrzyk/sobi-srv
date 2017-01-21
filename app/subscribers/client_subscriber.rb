class ClientSubscriber
  def initialize(payload)
    @payload = payload
  end

  def process!
    begin
      msg = JSON.parse @payload
      Client.create!(
        bike_id: msg['bike_id'],
        token: msg['token']
      )
      CLIENT_LOGGER.info success_text(msg['bike_id'])
    rescue ActiveRecord::ActiveRecordError => error
      CLIENT_LOGGER.error ar_error_text(msg['bike_id'], error)
      raise error
    end
    true
  end

  private

  def ar_error_text(bike_id, error)
    %(
      there is a problem with client message (bike_id: #{bike_id})
      can't import client data, following erros occured:
      #{error}
    )
  end

  def success_text(bike_id)
    %(
       import client message (key: #{bike_id}) with success
    )
  end
end
