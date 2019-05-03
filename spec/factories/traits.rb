FactoryBot.define do
  trait :lat_lng do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
