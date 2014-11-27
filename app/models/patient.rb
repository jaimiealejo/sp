class Patient < ActiveRecord::Base
  attr_accessible :birthday, :contact, :first_name, :last_name, :occupation, :sex, :status
end
