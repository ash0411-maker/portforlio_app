# frozen_string_literal: true

FactoryBot.define do
  factory :book_mark do
    association :tourist
    association :tour
  end
end
