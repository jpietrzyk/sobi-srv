class ClientImporter
  def initialize; end

  def process!
    Communication.data.keys.each do |key|
      msg = JSON.parse Communication.data.get(key)
      begin
        Communication.data.del key
        Client.create!(
          bike_id: msg['bike_id'],
          token: msg['token']
        )
        CLIENT_LOGGER.info success_text(key)
      rescue ActiveRecord::ActiveRecordError => error
        CLIENT_LOGGER.error ar_error_text(key, error)
        raise error
      end
    end
    true
  end

  private

  def ar_error_text(key, error)
    %(
      there is a problem with client message (key: #{key})
      can't import client data, following erros occured:
      #{error}
    )
  end

  def success_text(key)
    %(
       import client message (key: #{key}) with success
    )
  end
end
