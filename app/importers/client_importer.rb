class ClientImporter
  def initialize
    @clients = []
  end

  def process!
    Communication.data.keys.each do |key|
      msg = JSON.parse Communication.data.get(key)
      begin
        @clients.push(
          Client.create!(
            bike_id: msg['bike_id'],
            token: msg['token']
          )
        )
        Communication.data.del key
      rescue StandardError => error
        CLIENT_LOGGER.error std_error_text(key, error)
      else
        CLIENT_LOGGER.info success_text(key)
      end
    end
  end

  private

  def std_error_text(key, error)
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
