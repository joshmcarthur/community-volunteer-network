class CreateCommunityMemberCapabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :community_member_capabilities do |t|
      t.belongs_to :community_membership, null: false, foreign_key: true
      t.belongs_to :capability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
