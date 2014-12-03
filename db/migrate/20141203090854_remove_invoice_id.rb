class RemoveInvoiceId < ActiveRecord::Migration
  def up
  	remove_column :invoices, :invoice_id_id
  end

  def down
  end
end
