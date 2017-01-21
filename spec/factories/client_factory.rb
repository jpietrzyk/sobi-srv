FactoryGirl.define do
  factory :client do
    bike_id 1
    token { ClientHelper.generate_token }
  end
end
