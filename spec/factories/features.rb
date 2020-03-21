FactoryBot.define do
  factory :feature do
    key { Faker::Internet.slug }

    trait :disabled do
      disabled_at { 5.minutes.ago }
    end
  end
end
