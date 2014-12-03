class Product < ActiveRecord::Base
  attr_accessible :capital_price, :info, :name, :selling_price, :type
end
