class CapabilityParentIdNullable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :capabilities, :parent_id, true
  end
end
