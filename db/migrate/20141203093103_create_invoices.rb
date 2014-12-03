class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :patient
      t.decimal :total_amt_due
      t.decimal :amt_received
      t.decimal :balance
      t.string :status

      t.timestamps
    end
    add_index :invoices, :patient_id
  end
end
