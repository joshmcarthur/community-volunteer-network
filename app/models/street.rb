class Street < ApplicationRecord
  belongs_to :community
  validates :name, presence: true, uniqueness: { scope: :community_id }
end
