class Product < ActiveRecord::Base
  attr_accessible :capital_price, :info, :name, :selling_price, :prod_type
  validates :name, presence: true
  validates :capital_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
  validates :selling_price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
  
  def stock_available
    Inventory.where(product_id:self.id).sum(:quantity)
  end

  def name_and_price
  	self.name + ' - ' + self.selling_price.to_s
  end
end
