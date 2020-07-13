FactoryBot.define do
    factory :chat do
        association :room
        message { Faker::Lorem.characters(number:200) }
        is_tourist { Faker::Boolean.boolean }
    end
end