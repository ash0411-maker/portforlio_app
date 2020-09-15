# frozen_string_literal: true

FactoryBot.define do
  factory :chat do
    association :room
    association :tourist
    association :guide
    message { Faker::Lorem.characters(number: 200) }
    is_tourist { Faker::Boolean.boolean }
  end
end
