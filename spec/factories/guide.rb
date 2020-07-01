FactoryBot.define do
    factory :guide do
        email { Faker::Internet.email }
        family_name { Faker::Name.male_first_name }
        name { Faker::Name.male_first_name }
        identification_image { Refile::FileDouble.new("dummy", "no_image.jpg", content_type: "image/jpg") }
        selfy_image { Refile::FileDouble.new("dummy", "no_image.jpg", content_type: "image/jpg") }
        nationality { Faker::Nation.nationality }
        postal_code { Faker::Address.zip_code }
        address { Faker::Address.street_address }
        phone_number { Faker::PhoneNumber.cell_phone }
        introduction { Faker::PhoneNumber.cell_phone }
        password { 'password' }
        password_confirmation { 'password' }
    end

    factory :another_guide do
        email { Faker::Internet.email }
        password { 'password' }
        password_confirmation { 'password' }
    end
end