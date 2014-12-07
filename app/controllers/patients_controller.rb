class PatientsController < ApplicationController
  before_filter :set_patient, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @patients = Patient.all
    respond_with(@patients)
  end

  def show
    @procedures = Procedure.where(patient_id: @patient.id)
    respond_with(@patient)
  end

  def new
    @patient = Patient.new
    respond_with(@patient)
  end

  def edit
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.save
    respond_with(@patient)
  end

  def update
    @patient.update_attributes(params[:patient])
    respond_with(@patient)
  end

  def destroy
    @patient.destroy
    respond_with(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end
end
