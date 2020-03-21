class CommunityMembership < ApplicationRecord
  belongs_to :user
  belongs_to :community
  belongs_to :street, optional: true
  has_many :community_member_capabilities, dependent: :destroy
  has_many :capabilities, through: :community_member_capabilities

  delegate :name, :email, to: :user, allow_nil: true
end
