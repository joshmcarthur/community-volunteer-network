class Community < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :community_moderators, dependent: :destroy
  has_many :moderators, through: :community_moderators, source: :user

  def name=(new_name)
    self.slug = new_name.parameterize
    super
  end
end
