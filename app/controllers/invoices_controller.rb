class InvoicesController < ApplicationController
  before_filter :set_invoice, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invoices = Invoice.all
    respond_with(@invoices)
  end

  def show
    respond_with(@invoice)
  end

  def new
    @invoice = Invoice.new
    @invoice.patient = Patient.find(params[:patient_id]) if params[:patient_id]
    respond_with(@invoice)
  end

  def edit
    @invoice.compute_total_amt_due
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.balance = BigDecimal.new(params[:invoice][:total_amt_due]) - BigDecimal.new(params[:invoice][:amt_received])
    @invoice.patient = Patient.find(params[:patient_id])
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @total_amt_due = BigDecimal.new(params[:invoice][:total_amt_due])
    @amt_received = BigDecimal.new(params[:invoice][:amt_received])
    @patient_id = params[:patient_id]
    @balance = @total_amt_due - @amt_received
    @status = @balance.zero? ? 'Full Payment' : 'Partial Payment'
    @invoice.update_attributes(
      total_amt_due: params[:invoice][:total_amt_due],
      amt_received: params[:invoice][:amt_received],
      balance: @balance,
      patient_id: @patient_id,
      status: @status
    )
    redirect_to patient_path(Patient.find(@patient_id))
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  def generate
    @patient = Patient.find(params[:id])
    @invoice = Invoice.new
    @invoice.patient = @patient
    @invoice.create_from_procedure_invoice_details
    @invoice.save
    redirect_to edit_invoice_path(@invoice)
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end
