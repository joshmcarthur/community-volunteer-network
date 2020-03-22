class StreetSocialNetwork < ApplicationRecord
  belongs_to :street
  enum networks: {
    facebook_page: 10,
    whatsapp_group: 20
  }

  validates :network, presence: true, inclusion: { in: networks.keys }
  validates :link, presence: true
end
