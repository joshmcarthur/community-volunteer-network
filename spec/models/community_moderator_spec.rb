require "rails_helper"

RSpec.describe CommunityModerator, type: :model do
  subject { FactoryBot.build(:community_moderator) }
  it { is_expected.to be_valid }
end
