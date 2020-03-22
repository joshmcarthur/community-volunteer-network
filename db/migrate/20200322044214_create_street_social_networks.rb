class CreateStreetSocialNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :street_social_networks do |t|
      t.string :network
      t.belongs_to :street, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
