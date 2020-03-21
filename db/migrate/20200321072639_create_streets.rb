class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string :name, null: false
      t.string :google_places_id
      t.belongs_to :community, null: false, foreign_key: true

      t.timestamps
    end

    add_index :streets, %i[community_id name], unique: true
  end
end
