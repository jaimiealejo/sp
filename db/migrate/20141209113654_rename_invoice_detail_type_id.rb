class RenameInvoiceDetailTypeId < ActiveRecord::Migration
  def up
  	rename_column :invoice_details, :type_id, :procedure_id
  	add_column :invoice_details, :product_id, :integer
  end

  def down
  end
end
