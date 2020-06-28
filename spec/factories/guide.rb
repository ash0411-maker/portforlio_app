FactoryBot.define do
    factory :guide do
        email { Faker::Internet.email }
        password { 'password' }
        password_confirmation { 'password' }
    end
end