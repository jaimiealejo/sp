class InvoiceDetailsController < ApplicationController
  before_filter :set_invoice_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invoice_details = InvoiceDetail.all
    respond_with(@invoice_details)
  end

  def show
    respond_with(@invoice_detail)
  end

  def new
    @invoice_detail = InvoiceDetail.new
    @invoice_detail.invoice_type = 'Product'
    @patient = Patient.find(params[:patient_id]) if params[:patient_id]
  end

  def edit
    @invoice = Invoice.find(@invoice_detail.invoice_id)
    @patient = @invoice.patient
    @procedure = Procedure.find(@invoice_detail.procedure_id) if @invoice_detail.procedure_id
    @product = Product.find(@invoice_detail.product_id) if @invoice_detail.product_id
  end

  def create
    @invoice_detail = InvoiceDetail.new(params[:invoice_detail])
    @invoice_detail.product_id = params[:product_id]
    @patient = Patient.find(params[:patient_id]) if params[:patient_id]

    if @invoice_detail.valid?
      @invoice_detail.save

      @invoice = Invoice.new
      @invoice.patient = @patient
      @invoice.invoice_details << @invoice_detail
      @invoice.compute_total_amt_due
      @invoice.save

      redirect_to edit_invoice_path(@invoice, patient_id: @patient_id)
    else

      respond_with(@invoice_detail, patient_id: @patient_id)
    end
  end

  def update
    @invoice_detail.update_attributes(params[:invoice_detail])
    redirect_to edit_invoice_path(Invoice.find(@invoice_detail.invoice_id))
  end

  def destroy
    @invoice_detail.destroy
    respond_with(@invoice_detail)
  end

  private
    def set_invoice_detail
      @invoice_detail = InvoiceDetail.find(params[:id])
    end
end
