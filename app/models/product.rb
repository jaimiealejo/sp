class Product < ActiveRecord::Base
  belongs_to :product_id
  attr_accessible :capital_price, :info, :name, :selling_price, :type
end
