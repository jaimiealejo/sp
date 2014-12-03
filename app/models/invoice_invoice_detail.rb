class InvoiceInvoiceDetail < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :invoice_detail
  attr_accessible :remarks
end
