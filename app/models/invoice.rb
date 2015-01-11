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
    self.total_amt_due = self.invoice_details.map(&:price).sum if self.invoice_details.present?
  end

  def is_partial_invoice?
    return self.status == "Partial Payment"
  end

  def self.compute_current_invoice
    Invoice.where("created_at between ? and ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day).map(&:amt_received).sum
  end

  def self.compute_yesterday_invoice
    Invoice.where("created_at between ? and ?", Date.yesterday.beginning_of_day, Date.yesterday.end_of_day).map(&:amt_received).sum
  end

  def self.compute_current_week_invoice
    Invoice.where("created_at between ? and ?", Date.today.beginning_of_week, Date.today.end_of_week).map(&:amt_received).sum
  end

  def self.compute_last_week_invoice
    Invoice.where("created_at between ? and ?", 1.week.ago.beginning_of_week, 1.week.ago.end_of_week).map(&:amt_received).sum
  end

  def self.compute_current_month_invoice
    Invoice.where("created_at between ? and ?", Date.today.beginning_of_month, Date.today.end_of_month).map(&:amt_received).sum
  end

  def self.compute_last_month_invoice
    Invoice.where("created_at between ? and ?", 1.month.ago.beginning_of_month, 1.month.ago.end_of_month).map(&:amt_received).sum
  end

end
