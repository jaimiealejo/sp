class CreateInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_details do |t|
      t.integer :quantity
      t.decimal :price
      t.string :type
      t.references :type

      t.timestamps
    end
    add_index :invoice_details, :type_id
  end
end
