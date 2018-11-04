
FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.first_name }
    password 'password123'
    password_confirmation 'password123'
  end
end
