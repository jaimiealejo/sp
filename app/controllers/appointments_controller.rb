class AppointmentsController < ApplicationController
  before_filter :set_appointment, only: [:show, :edit, :update, :destroy, :cancel]
  before_filter :set_index, only: [:new, :edit]
  respond_to :html

  def index
    @appointments = Appointment.all.sort_by &:sched
    respond_with(@appointments.reverse)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    @appointment.sched = DateTime.now
    @procedure = Procedure.new
    @procedure.patient = Patient.find(params[:patient]) if params[:patient]
    @appointment.procedure = @procedure
    @appointment.est_time = '30'
    respond_with(@appointment)
  end

  def edit
    @appointment.sched = DateTime.parse(@appointment.sched)
  end

  def create
    sched = ""+params[:appointment]["sched(1i)"]+"-"+params[:appointment]["sched(2i)"]+"-"+params[:appointment]["sched(3i)"]+"T"+params[:appointment]["sched(4i)"]+":"+params[:appointment]["sched(5i)"]+"+08:00"
    @procedure = Procedure.new
    @procedure.procedure = params[:procedure]
    @procedure.patient = Patient.find(params[:patient_id])
    @procedure.save

    @appointment = Appointment.new(
      sched: DateTime.parse(sched),
      remarks: params[:appointment][:remarks],
      est_time: params[:est_time_label].to_i == 1 ? params[:est_time] : (params[:est_time].to_i * 60)
    )
    @appointment.procedure = @procedure
    @appointment.save

    redirect_path(params[:index])
  end

  def update
    sched = ""+params[:appointment]["sched(1i)"]+"-"+params[:appointment]["sched(2i)"]+"-"+params[:appointment]["sched(3i)"]+"T"+params[:appointment]["sched(4i)"]+":"+params[:appointment]["sched(5i)"]+"+08:00"
    @appointment.update_attributes(
      sched: DateTime.parse(sched),
      remarks: params[:appointment][:remarks],
      est_time: params[:est_time_label].to_i == 1 ? params[:est_time] : (params[:est_time].to_i * 60)
    )
    @procedure = @appointment.procedure
    @procedure.update_attributes(
      procedure: params[:procedure],
      patient_id: params[:patient_id]
    )
    redirect_path(params[:index])
  end

  def cancel
    @appointment.update_attributes(remarks: 'Cancelled')
    redirect_path(params[:index])
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_index
      @index = params[:index] || nil
    end

    def redirect_path(to_root)
      if to_root
        redirect_to root_path(anchor: 'appointments')
      else
        redirect_to patient_path(@appointment.procedure.patient)
      end
    end
end
