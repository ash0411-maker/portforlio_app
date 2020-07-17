# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.characters(number: 10) }
  end
end
