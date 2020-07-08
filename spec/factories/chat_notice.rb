# frozen_string_literal: true

FactoryBot.define do
  factory :chat_notice do
    association :chat
    association :guide_visitor, factory: :guide
    association :guide_visited, factory: :guide
    association :tourist_visitor, factory: :tourist
    association :tourist_visited, factory: :tourist
    checked { Faker::Boolean.boolean }
  end
end
