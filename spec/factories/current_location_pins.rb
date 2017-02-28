FactoryGirl.define do
  factory :current_location_pin do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
