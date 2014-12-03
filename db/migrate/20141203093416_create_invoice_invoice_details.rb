class CreateInvoiceInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_invoice_details do |t|
      t.references :invoice
      t.references :invoice_detail
      t.text :remarks

      t.timestamps
    end
    add_index :invoice_invoice_details, :invoice_id
    add_index :invoice_invoice_details, :invoice_detail_id
  end
end
