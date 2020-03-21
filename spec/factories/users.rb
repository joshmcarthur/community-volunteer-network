FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "changeme" }
    password_confirmation { "changeme" }
  end
end
