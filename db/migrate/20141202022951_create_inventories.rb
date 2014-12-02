class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :inventory_id
      t.integer :quantity
      t.boolean :action
      t.text :remarks
      t.date :inv_date

      t.timestamps
    end
    add_index :inventories, :inventory_id_id
  end
end
