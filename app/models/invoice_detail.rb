class InvoiceDetail < ActiveRecord::Base
  belongs_to :type_id
  attr_accessible :invoice_details_id, :price, :quantity, :type
end
