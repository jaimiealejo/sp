class DashboardController < ApplicationController
  def index
  	@patients = Patient.all
  	@appointments = Appointment.all
  end

end
