FactoryGirl.define do
  factory :route_pin do
    lat       { Faker::Address.latitude }
    lng       { Faker::Address.longitude }
  end
end
