class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :type
      t.decimal :capital_price
      t.decimal :selling_price
      t.text :info

      t.timestamps
    end
  end
end
