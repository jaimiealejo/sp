class InvoiceInvoiceDetailsController < ApplicationController
  before_filter :set_invoice_invoice_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invoice_invoice_details = InvoiceInvoiceDetail.all
    respond_with(@invoice_invoice_details)
  end

  def show
    respond_with(@invoice_invoice_detail)
  end

  def new
    @invoice_invoice_detail = InvoiceInvoiceDetail.new
    respond_with(@invoice_invoice_detail)
  end

  def edit
  end

  def create
    @invoice_invoice_detail = InvoiceInvoiceDetail.new(params[:invoice_invoice_detail])
    @invoice_invoice_detail.save
    respond_with(@invoice_invoice_detail)
  end

  def update
    @invoice_invoice_detail.update_attributes(params[:invoice_invoice_detail])
    respond_with(@invoice_invoice_detail)
  end

  def destroy
    @invoice_invoice_detail.destroy
    respond_with(@invoice_invoice_detail)
  end

  private
    def set_invoice_invoice_detail
      @invoice_invoice_detail = InvoiceInvoiceDetail.find(params[:id])
    end
end
