class RemoveInventoryId < ActiveRecord::Migration
  def up
  	remove_column :inventories, :inventory_id_id
  end

  def down
  end
end
