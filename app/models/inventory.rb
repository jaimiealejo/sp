class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :action, :quantity, :remarks
end
