class Appointment < ActiveRecord::Base
  belongs_to :procedure
  attr_accessible :remarks, :sched, :est_time
  validates :sched, presence: true

  def is_confirmed?
  	return self.remarks == 'Confirmed'
  end

  def check_range
  	q = "%#{self.sched.split(' ').first}%"
  	appointments = Appointment.where("sched like ?", q)
  	appointments.each do |appointment|
  	  to_range = DateTime.parse(appointment.sched) 
  	  if appointment.est_time.present? && !appointment.est_time.to_i.zero?
		end_range = to_range + Rational(appointment.est_time, 1440)
  	    return true if (to_range..end_range).include?self.sched
  	  else
  	  	return true if self.sched == appointment.sched
  	  end
  	end
  	return false
  end
end
