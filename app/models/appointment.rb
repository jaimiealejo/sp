class Appointment < ActiveRecord::Base
  belongs_to :procedure_id
  attr_accessible :remarks, :sched
end
