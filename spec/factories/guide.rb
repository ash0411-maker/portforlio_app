FactoryBot.define do
    factory :guide do
        family_name { Faker::Name.male_first_name }
        name { Faker::Name.male_first_name }
        email { Faker::Internet.email }
        nationality { Faker::Nation.nationality }
        postal_code { Faker::Address.zip_code }
        address { Faker::Address.street_address }
        phone_number { Faker::PhoneNumber.cell_phone }
        identification_image_id { Faker::Avatar.image }
        introduction { Faker::Name.male_first_name }
        password { 'password' }
        password_confirmation { 'password' }
        after(:create) do |guide|
            create(:tour, guide: guide)
          end
    end
end


