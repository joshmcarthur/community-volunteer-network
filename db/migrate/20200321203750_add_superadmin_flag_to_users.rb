class AddSuperadminFlagToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :superadmin, :boolean, null: false, default: false
  end
end
