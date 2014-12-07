class InventoriesController < ApplicationController
  before_filter :set_inventory, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventories = Inventory.all.sort_by &:updated_at
    respond_with(@inventories)
  end

  def show
    respond_with(@inventory)
  end

  def new
    @inventory = Inventory.new
    @inventory.product = Product.find(params[:product_id]) if params[:product_id]
    respond_with(@inventory)
  end

  def edit
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    @inventory.product = Product.find(params[:product_id])
    @inventory.user = current_user
    @inventory.save
    redirect_to inventories_path
  end

  def update
    @inventory.update_attributes(
      product_id: params[:product_id],
      quantity: params[:inventory][:quantity],
      action: params[:inventory][:action],
      remarks: params[:inventory][:remarks],
      user_id: current_user.id
    )
    redirect_to inventories_path
  end

  def destroy
    @inventory.destroy
    respond_with(@inventory)
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end
end
