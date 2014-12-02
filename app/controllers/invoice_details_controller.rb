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
    respond_with(@invoice_detail)
  end

  def edit
  end

  def create
    @invoice_detail = InvoiceDetail.new(params[:invoice_detail])
    @invoice_detail.save
    respond_with(@invoice_detail)
  end

  def update
    @invoice_detail.update_attributes(params[:invoice_detail])
    respond_with(@invoice_detail)
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
