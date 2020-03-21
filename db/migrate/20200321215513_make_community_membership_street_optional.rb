class MakeCommunityMembershipStreetOptional < ActiveRecord::Migration[6.0]
  def change
    change_column_null :community_memberships, :street_id, true
  end
end
