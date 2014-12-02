class InventoriesController < ApplicationController
  before_filter :set_inventory, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inventories = Inventory.all
    respond_with(@inventories)
  end

  def show
    respond_with(@inventory)
  end

  def new
    @inventory = Inventory.new
    respond_with(@inventory)
  end

  def edit
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    @inventory.save
    respond_with(@inventory)
  end

  def update
    @inventory.update_attributes(params[:inventory])
    respond_with(@inventory)
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
