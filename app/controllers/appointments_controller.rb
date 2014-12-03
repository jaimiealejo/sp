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
    @appointment.sched = DateTime.now
    @appointment.procedure = Procedure.new
    respond_with(@appointment)
  end

  def edit
    @appointment.sched = DateTime.parse(@appointment.sched)
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
    sched = ""+params[:appointment]["sched(1i)"]+"-"+params[:appointment]["sched(2i)"]+"-"+params[:appointment]["sched(3i)"]+"T"+params[:appointment]["sched(4i)"]+":"+params[:appointment]["sched(5i)"]+"+08:00"
    @appointment.update_attributes(
      sched: DateTime.parse(sched),
      remarks: params[:appointment][:remarks]
    )

    @procedure = @appointment.procedure
    @procedure.update_attributes(
      procedure: params[:procedure],
      patient_id: params[:patient_id]
    )
    redirect_to appointment_path(@appointment)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
end
