class Bike < ActiveRecord::Base
  validates :token, presence: true, length: { is: 690 }
end
