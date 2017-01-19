class Client < ActiveRecord::Base
  validates :bike_id, presence: true, type: { type: :integer }
  validates :token, presence: true, length: { is: 690 }

  class << self
    def import_clients_data!
      Communication.data.keys.each do |key|
        msg = JSON.parse Communication.data.get(key)
        # TODO We should here catch exception
        if Client.create(bike_id: msg['bike_id'], token: msg['token'])
          Communication.data.del key
        else
          # TODO we should log it
        end

        # TODO reset connection with db (sqlite)
      end
    end
  end
end
