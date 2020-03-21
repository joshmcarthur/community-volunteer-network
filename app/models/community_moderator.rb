class CommunityModerator < ApplicationRecord
  belongs_to :community
  belongs_to :user

  delegate :name, to: :user
  delegate :name, to: :community, prefix: true
end
