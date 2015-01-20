class Appointment < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
  belongs_to :procedure
  attr_accessible :remarks, :sched, :est_time, :starts_at, :updated_by
  validate :check_range


  def is_confirmed?
    return self.remarks == 'Confirmed'
  end

  def is_cancelled?
    return self.remarks == 'Cancelled'
  end

  def check_range
    q = "%#{self.sched.split(' ').first.split('T').first}%"
    appointments = Appointment.where("sched like ? and id != ?", q, self.id)
    appointments.each do |appointment|
      next if appointment.remarks == 'Cancelled'
      if self.sched == appointment.sched
        return errors.add(:sched, "Schedule is already taken. Please select another date/time.")
      end

      to_range = DateTime.parse(appointment.sched)
      if appointment.est_time.present? && !appointment.est_time.to_i.zero?
        end_range = to_range + appointment.est_time.to_i.minutes
        date_range = to_range.strftime('%H%M').to_i...end_range.strftime('%H%M').to_i
        if date_range.include?DateTime.parse(self.sched).strftime('%H%M').to_i
          return errors.add(:sched, "Schedule is already taken. Please select another date/time.")
        end

        if self.est_time.present? && !self.est_time.to_i.zero?
          sched_end = DateTime.parse(self.sched) + self.est_time.to_i.minutes
          if date_range.include?sched_end.strftime('%H%M').to_i
            return errors.add(:sched, "Schedule is already taken. Please select another date/time.")
          end
        end
      end
    end
  end
end
