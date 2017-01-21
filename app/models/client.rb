class Client < ActiveRecord::Base
  validates :bike_id, presence: true, type: { type: :integer }
  validates :token, presence: true, length: { is: 690 }
end
