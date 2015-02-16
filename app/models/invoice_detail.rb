class InvoiceDetail < ActiveRecord::Base
  belongs_to :type
  attr_accessible :price, :quantity, :invoice_type, :product_id, :procedure_id, :invoice_id
  validate :stock_quantity
  before_save :compute_price
  after_create :create_inventory

  def stock_quantity
    if self.product_id
      product = Product.find(self.product_id)
      stock = product.stock_available
      if (stock < self.quantity)
        errors.add(:quantity, "Only #{stock} left of #{product.name}")
      end
    end
  end

  def compute_price
  	if self.product_id
  		product = Product.find(self.product_id)
      self.price = BigDecimal.new(self.quantity) * BigDecimal.new(product.selling_price)
    end
  end

  def create_inventory
    if self.product_id
    	product = Product.find(self.product_id)
    	inventory = Inventory.new
    	inventory.product = product
    	inventory.quantity = self.quantity * -1
    	inventory.save
    end
  end
end
