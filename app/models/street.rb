class Street < ApplicationRecord
  belongs_to :community
  scope :alphabetic, -> { order(name: :asc) }
  has_many :memberships, class_name: :CommunityMembership, dependent: :nullify
  validates :name, presence: true, uniqueness: { scope: :community_id }
  has_many :social_networks, class_name: :StreetSocialNetwork, dependent: :destroy
end
