FactoryGirl.define do
  factory :client do |c|
    bike_id 1
    token { ClientHelper.generate_token }
  end
end
