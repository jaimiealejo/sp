class RenameTypeColumn < ActiveRecord::Migration
  def up
  	rename_column :products, :type, :prod_type
  	rename_column :invoice_details, :type, :invoice_type
  end

  def down
  end
end
