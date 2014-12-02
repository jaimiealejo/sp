class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :invoice_id
      t.decimal :total_amt_due
      t.decimal :amt_received
      t.decimal :balance
      t.date :invoice_date
      t.string :status

      t.timestamps
    end
    add_index :invoices, :invoice_id_id
  end
end
