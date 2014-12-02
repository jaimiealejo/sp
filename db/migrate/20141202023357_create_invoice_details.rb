class CreateInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_details do |t|
      t.string :invoice_details_id
      t.integer :quantity
      t.decimal :price
      t.string :type
      t.references :type_id

      t.timestamps
    end
    add_index :invoice_details, :type_id_id
  end
end
