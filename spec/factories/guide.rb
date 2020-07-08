# frozen_string_literal: true

FactoryBot.define do
  factory :guide, class: Guide do
    email { Faker::Internet.email }
    family_name { Faker::Name.male_first_name }
    name { Faker::Name.male_first_name }
    identification_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no_image.jpg')) }
    selfy_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no_image.jpg')) }
    nationality { Faker::Nation.nationality }
    postal_code { Faker::Address.zip_code }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    introduction { Faker::PhoneNumber.cell_phone }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :another_guide, class: Guide do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
