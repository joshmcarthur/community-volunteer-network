class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :community_memberships, dependent: :destroy
  has_many :communities, through: :community_memberships
  has_many :community_moderators, dependent: :destroy
  has_many :moderated_communities, through: :community_moderators, source: :community
  has_many :capabilities, through: :community_memberships, source: :capabilities
end
