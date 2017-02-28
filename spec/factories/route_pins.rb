FactoryGirl.define do
  factory :route_pin do
    lat       { Faker::Address.latitude }
    lng       { Faker::Address.longitude }
    route_leg { (0..3).to_a.sample }
  end
end
