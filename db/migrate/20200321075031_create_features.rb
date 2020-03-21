class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :key
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
