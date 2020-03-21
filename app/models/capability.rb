class Capability < ApplicationRecord
  belongs_to :parent, class_name: :Capability, optional: true
  validates :name, presence: true, uniqueness: { scope: :parent_id }
end
