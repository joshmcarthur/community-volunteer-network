FactoryBot.define do
  factory :street do
    name { Faker::Address.street_name }
    community
  end
end
