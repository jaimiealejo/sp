class RemoveInvoiceDetailId < ActiveRecord::Migration
  def up
  	remove_column :invoice_details, :invoice_details_id
  end

  def down
  end
end
