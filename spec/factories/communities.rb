FactoryBot.define do
  factory :community do
    name { Faker::Address.city }
    public_description { Faker::Lorem.sentence }
  end
end
