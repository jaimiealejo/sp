class AppointmentsController < ApplicationController
  before_filter :set_appointment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @appointments = Appointment.all
    respond_with(@appointments)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    @appointment.sched = Date.today
    respond_with(@appointment)
  end

  def edit
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    @procedure = Procedure.new
    @procedure.procedure = params[:procedure]
    @procedure.patient = Patient.find(params[:patient_id])
    @procedure.save
    @appointment.procedure = @procedure
    @appointment.save
    respond_with(@appointment)
  end

  def update
    @appointment.update_attributes(params[:appointment])
    respond_with(@appointment)
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
end
