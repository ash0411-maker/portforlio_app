# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    association :tour
    association :tourist
    association :guide
    action { 'update' }
  end
end
