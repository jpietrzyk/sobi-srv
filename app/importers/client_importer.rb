class ClientImporter

  def initialize
  end

  def process!
    Communication.data.keys.each do |key|
      msg = JSON.parse Communication.data.get(key)
      begin
        client = Client.create!(
          bike_id: msg['bike_id'],
          token: msg['token']
        )

        Communication.data.del key
      rescue StandardError => error
        CLIENT_LOGGER.error std_error_text(key, error)
        p std_error_text(key, error)
      rescue Exception => error
        CLIENT_LOGGER.error exc_error_text(key, error)
      else
        CLIENT_LOGGER.info success_text(key)
      end
    end
  end

  private

  def std_error_text key, error
    %(
      there is a problem with client message (key: #{key})
      can't import client data, following erros occured:
      #{error}
    )
  end

  def exc_error_text key, error
    %(
      really strange problem (key: #{key})
      look at error description:
      #{error}
    )
  end

  def success_text key
    %(
       import client message (key: #{key}) with success
    )
  end
end
