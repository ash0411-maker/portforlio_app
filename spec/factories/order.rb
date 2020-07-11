FactoryBot.define do
    factory :order do
        association :guide
        association :tourist
        tour_id { Faker::Number.number(digits:1) }
        tour_title { Faker::Lorem.characters(number:10) }
        tour_body { Faker::Lorem.characters(number:100) }
        tour_contents_of_price { Faker::Lorem.characters(number:5) }
        tour_capacity { Faker::Number.number(digits:2) }
        tour_time { Faker::Lorem.characters(number:5) }
        tour_city { Faker::Lorem.characters(number:5) }
        tour_genre { Faker::Lorem.characters(number:5) }
        tour_price { Faker::Number.number(digits:1) }
        tour_date { Faker::Date.in_date_period(year: 2018, month: 2) }
        total_people { Faker::Lorem.characters(number:5) }
        total_price { Faker::Lorem.characters(number:5) }
        admin_sales { Faker::Lorem.characters(number:5) }
        guide_sales { Faker::Lorem.characters(number:5) }
    end
end