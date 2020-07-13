
FactoryBot.define do
    factory :contact do
        name { Faker::Games::Pokemon.name }
        email { Faker::Internet.email }
        user_text { Faker::Lorem.characters(number:100) }
        admin_text { Faker::Lorem.characters(number:100) }
    end
end