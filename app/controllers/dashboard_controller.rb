class DashboardController < ApplicationController
  def index
  	@patients = Patient.all.sort_by &:last_name
  	@appointments = Appointment.all.sort_by(&:sched).reverse
  	@products = Product.all.sort_by &:name
  end

end
