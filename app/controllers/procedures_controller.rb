class ProceduresController < ApplicationController
  before_filter :set_procedure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @procedures = Procedure.all.sort_by &:id
    respond_with(@procedures)
  end

  def show
    respond_with(@procedure)
  end

  def new
    @procedure = Procedure.new
    @patient = Patient.find(params[:patient_id])
    @procedure.patient = @patient
    @invoice_detail = InvoiceDetail.new
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @invoice_detail = @procedure.invoice_detail
  end

  def create
    @procedure = Procedure.new(params[:procedure])
    @procedure.patient = Patient.find(params[:patient_id])

    @invoice_detail = InvoiceDetail.new
    @invoice_detail.price = BigDecimal.new(params[:price])
    @invoice_detail.quantity = 1
    @invoice_detail.invoice_type = 'Procedure'
    @invoice_detail.save

    @procedure.invoice_detail = @invoice_detail
    if (@procedure.save)
      redirect_to patient_path(@procedure.patient)
    else
      respond_with(@procedure.patient)
    end
  end

  def update
    @procedure.update_attributes(params[:procedure])
    @invoice_detail = @procedure.invoice_detail || InvoiceDetail.new(procedure_id: @procedure.id)
    @invoice_detail.update_attributes(price: BigDecimal.new(params[:price]))
    redirect_to patient_path(@procedure.patient)
  end

  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end
end
