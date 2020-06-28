FactoryBot.define do
    factory :review do
      comment { Faker::Lorem.characters(number:200) }
    end
  end