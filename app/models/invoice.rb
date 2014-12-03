class Invoice < ActiveRecord::Base
  belongs_to :patient
  attr_accessible :amt_received, :balance, :status, :total_amt_due, :patient_id
end
