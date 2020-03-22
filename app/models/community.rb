class Community < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :community_moderators, dependent: :destroy
  has_many :moderators, through: :community_moderators, source: :user
  has_many :memberships, class_name: :CommunityMembership, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :streets, dependent: :destroy

  def name=(new_name)
    self.slug = new_name.parameterize
    super
  end
end
