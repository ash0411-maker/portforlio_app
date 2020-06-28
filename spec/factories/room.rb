FactoryBot.define do
    factory :room do
        association :tourist
        association :guide
    end
end