FactoryBot.define do
    factory :notification do
        association :tour
        association :review
        association :tourist
        association :guide
        checked { Faker::Boolean.boolean }
        action { Faker::Lorem.characters(number:10) }
    end
end