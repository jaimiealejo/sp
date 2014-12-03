class InvoiceDetail < ActiveRecord::Base
  belongs_to :type
  attr_accessible :price, :quantity, :invoice_type
end
