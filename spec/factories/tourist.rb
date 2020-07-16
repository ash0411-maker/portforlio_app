# frozen_string_literal: true

FactoryBot.define do
  factory :tourist do
    email { Faker::Internet.email }
    family_name { Faker::Name.male_first_name }
    name { Faker::Name.male_first_name }
    sex { '女性' }
    birth_year { Faker::Date.birthday(min_age: 18, max_age: 65) }
    nationality { Faker::Nation.nationality }
    postal_code { Faker::Address.zip_code }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
