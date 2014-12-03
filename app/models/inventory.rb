class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :action, :quantity, :remarks, :product_id, :user_id
  validates :quantity, presence: true
end
