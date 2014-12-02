class Inventory < ActiveRecord::Base
  belongs_to :inventory_id
  attr_accessible :action, :inv_date, :quantity, :remarks
end
