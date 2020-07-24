# frozen_string_literal: true

FactoryBot.define do
  factory :tour_photo do
    association :tour
    image_id { Faker::Lorem.characters(number: 10) }
  end
end
