class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string :name, unique: true, null: false
      t.string :slug, unique: true, null: false
      t.string :public_description

      t.timestamps
    end
  end
end
