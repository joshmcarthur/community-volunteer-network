require "rails_helper"

RSpec.describe CommunityMembership, type: :model do
  subject { FactoryBot.build(:community_membership) }
  it { is_expected.to be_valid }
end
