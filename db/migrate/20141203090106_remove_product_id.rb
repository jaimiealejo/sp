class RemoveProductId < ActiveRecord::Migration
  def up
  	remove_column :products, :product_id_id
  end

  def down
  end
end
