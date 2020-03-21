class Feature < ApplicationRecord
  class DisabledError < StandardError; end

  validates :key, presence: true, uniqueness: true
  scope :enabled, -> { where(disabled_at: nil) }

  def key=(new_key)
    super(new_key.underscore)
  end

  def self.on?(key)
    enabled.where(key: key).exists?
  end

  def self.demand!(key)
    on?(key) || (fail DisabledError, "Sorry, #{key} is not available right now.")
  end
end
