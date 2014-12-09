class AddInvoiceIdToInvoiceDetail < ActiveRecord::Migration
  def change
  	add_column :invoice_details, :invoice_id, :integer
  end
end
