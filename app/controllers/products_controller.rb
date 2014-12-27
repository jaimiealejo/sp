class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])
    @product.capital_price = BigDecimal.new('1') if !@product.capital_price.present?
    @product.save
    redirect_to root_path(anchor: 'products')
  end

  def update
    @product.update_attributes(params[:product])
    redirect_to root_path(anchor: 'products')
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
