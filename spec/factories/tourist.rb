FactoryBot.define do
    factory :tourist do
        email { Faker::Internet.email }
        password { 'password' }
        password_confirmation { 'password' }
    end
end