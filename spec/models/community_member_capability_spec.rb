require "rails_helper"

RSpec.describe CommunityMemberCapability, type: :model do
  subject { FactoryBot.build(:community_member_capability) }
  it { is_expected.to be_valid }
end
