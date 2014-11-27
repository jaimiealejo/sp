class Appointment < ActiveRecord::Base
  belongs_to :procedure
  attr_accessible :remarks, :sched
  validates :sched, uniqueness: true, unless: :past_date?
  def past_date?
  	return true if Date.today.year > sched.year
  	if Date.today.year == sched.year
  		return true if Date.today.month < sched.month
  		if Date.today.month == sched.month
  			return true if Date.today.day > sched.day
  		end
  	end
  	return false
  end
end
