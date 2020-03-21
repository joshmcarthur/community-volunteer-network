class CommunityMemberCapability < ApplicationRecord
  belongs_to :community_membership
  belongs_to :capability
end
