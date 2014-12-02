class Invoice < ActiveRecord::Base
  belongs_to :invoice_id
  attr_accessible :amt_received, :balance, :invoice_date, :status, :total_amt_due
end
