class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :product_id
      t.string :name
      t.boolean :type
      t.decimal :capital_price
      t.decimal :selling_price
      t.text :info

      t.timestamps
    end
    add_index :products, :product_id_id
  end
end
