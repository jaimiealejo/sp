class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :product
      t.integer :quantity
      t.boolean :action
      t.references :user
      t.text :remarks

      t.timestamps
    end
    add_index :inventories, :product_id
    add_index :inventories, :user_id
  end
end
