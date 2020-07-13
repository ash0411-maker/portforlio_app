FactoryBot.define do
  factory :tour do
    association :guide
    association :genre
    association :city
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:100) }
    contents_of_price { Faker::Lorem.characters(number:5) }
    capacity { Faker::Number.number(digits:2) }
    time { Faker::Lorem.characters(number:5) }
    price { Faker::Number.number(digits:1) }
    is_active { Faker::Boolean.boolean }
    meetingpoint_address { Faker::Lorem.characters(number:5) }
    meetingpoint_introduction { Faker::Lorem.characters(number:5) }
  end
end