class CreateCapabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :capabilities do |t|
      t.string :name
      t.text :description
      t.belongs_to :parent, null: false, foreign_key: { to_table: :capabilities }

      t.timestamps
    end
  end
end
