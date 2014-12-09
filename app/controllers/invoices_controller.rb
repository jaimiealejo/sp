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
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.balance = BigDecimal.new(params[:invoice][:total_amt_due]) - BigDecimal.new(params[:invoice][:amt_received])
    @invoice.patient = Patient.find(params[:patient_id])
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @balance = BigDecimal.new(params[:invoice][:total_amt_due]) - BigDecimal.new(params[:invoice][:amt_received])
    @invoice.update_attributes(
      total_amt_due: params[:invoice][:total_amt_due],
      amt_received: params[:invoice][:amt_received],
      balance: @balance,
      patient_id: params[:patient_id],
      status: params[:invoice][:status]
    )
    respond_with(@invoice)
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end
