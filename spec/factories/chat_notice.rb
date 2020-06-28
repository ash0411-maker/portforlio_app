FactoryBot.define do
    factory :chat_notice do
        association :chat
        association :guide_visitor
        association :guide_visited
        association :tourist_visitor
        association :tourist_visited
        checked { Faker::Boolean.boolean }
    end
end