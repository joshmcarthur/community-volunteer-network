FactoryBot.define do
  factory :capability do
    name { Faker::Job.title }
    description { Faker::Lorem.sentence }
  end
end
