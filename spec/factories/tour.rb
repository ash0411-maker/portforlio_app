FactoryBot.define do
    factory :tour do
        guide_id { Faker::Number.number(digits:2) }
        city_id { Faker::Number.number(digits:2) }
        genre_id { Faker::Number.number(digits:2) }
        title { Faker::Lorem.characters(number:10) }
        body { Faker::Lorem.characters(number:100) }
        contents_of_price { Faker::Lorem.characters(number:50) }
        capacity { Faker::Number.number(digits:2) }
        time { Faker::Lorem.characters(number:5) }
        price { Faker::Number.number(digits:10) }
        is_active { Faker::Boolean.boolean }
        meetingpoint_address { Faker::Lorem.characters(number:5) }
        meetingpoint_introduction { Faker::Lorem.characters(number:5) }
    end
end
  