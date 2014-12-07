class Appointment < ActiveRecord::Base
  belongs_to :procedure
  attr_accessible :remarks, :sched
  validates :sched, presence: true

  def is_confirmed?
  	return self.remarks == 'Confirmed'
  end
end
