class CreateCommunityModerators < ActiveRecord::Migration[6.0]
  def change
    create_table :community_moderators do |t|
      t.belongs_to :community, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :community_moderators, %i[community_id user_id], unique: true
  end
end
