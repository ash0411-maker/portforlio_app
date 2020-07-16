# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.characters(number: 200) }
    association :tour
    association :tourist
  end
end
