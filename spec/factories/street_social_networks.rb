FactoryBot.define do
  factory :street_social_network do
    network { StreetSocialNetwork.networks.keys.sample }
    street
    link { Faker::Internet.url }
  end
end
