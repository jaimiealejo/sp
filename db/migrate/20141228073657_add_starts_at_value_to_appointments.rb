class AddStartsAtValueToAppointments < ActiveRecord::Migration
  def change
  	Appointment.all.each do |appointment|
  		starts_at = DateTime.parse(appointment.sched)
  		appointment.update_attributes(starts_at: starts_at)
  	end
  end
end
