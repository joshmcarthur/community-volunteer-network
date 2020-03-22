require "rails_helper"

RSpec.describe StreetSocialNetwork, type: :model do
  subject { FactoryBot.build(:street_social_network) }
  it { is_expected.to be_valid }
end
