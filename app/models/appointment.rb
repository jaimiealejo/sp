class Appointment < ActiveRecord::Base
  belongs_to :procedure
  attr_accessible :remarks, :sched
  
end
