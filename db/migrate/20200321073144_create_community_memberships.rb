class CreateCommunityMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :community_memberships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true
      t.belongs_to :street, null: false, foreign_key: true

      t.timestamps
    end

    add_index :community_memberships, %i[user_id community_id], unique: true
  end
end
