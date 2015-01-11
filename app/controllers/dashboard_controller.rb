class DashboardController < ApplicationController
  def index
  	@patients = Patient.all.sort_by &:last_name
  	@appointments = Appointment.all.sort_by(&:sched).reverse
  	@products = Product.all.sort_by &:name
  	@invoices = Invoice.all.sort_by &:updated_at
  	@invoice_for_today = Invoice.compute_current_invoice
  	@invoice_for_yesterday = Invoice.compute_yesterday_invoice
  	@invoice_for_current_week = Invoice.compute_current_week_invoice
  	@invoice_for_last_week = Invoice.compute_last_week_invoice
  	@invoice_for_current_month = Invoice.compute_current_month_invoice
  	@invoice_for_last_month = Invoice.compute_last_month_invoice
  	@appointments_for_today = Appointment.where("starts_at between ? and ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
  end
  
  def update_user_note
  	current_user.update_attributes(
  	  notes: params[:user][:notes]
  	)
  	redirect_to root_path
  end
end
