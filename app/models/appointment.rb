class Appointment < ActiveRecord::Base
  belongs_to :procedure
  attr_accessible :remarks, :sched
  validates :sched, presence: true
  
end
