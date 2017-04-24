FactoryGirl.define do
  factory :suggestion_pin do
    label           { Faker::Hipster.word }
    description     { Faker::Hipster.sentence }
    category        { (0..4).to_a.sample }
    lat             { Faker::Address.latitude }
    lng             { Faker::Address.longitude }
    message         { Faker::Hipster.sentences(2) }
    name            { Faker::Name.name }
    sequence :email do |n| 
      "#{n}#{Faker::Internet.email}" 
    end
  end
end
