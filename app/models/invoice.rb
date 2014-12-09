class Invoice < ActiveRecord::Base
  belongs_to :patient
  attr_accessible :amt_received, :balance, :status, :total_amt_due, :patient_id
  has_many :invoice_details

  def create_from_procedure_invoice_details
  	details = self.patient.procedures.collect(&:invoice_detail).compact
    details.each do |detail|
    	self.invoice_details << detail unless detail.invoice_id
    end
    compute_total_amt_due
  end

  def compute_total_amt_due
    self.total_amt_due = self.invoice_details.map(&:price).sum
  end
end
