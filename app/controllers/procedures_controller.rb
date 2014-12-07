class ProceduresController < ApplicationController
  before_filter :set_procedure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @procedures = Procedure.all.sort_by &:id
    respond_with(@procedures)
  end

  def show
    respond_with(@procedure)
  end

  def new
    @procedure = Procedure.new
    @patient = Patient.find(params[:patient_id])
    @procedure.patient = @patient
  end

  def edit
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @procedure = Procedure.new(params[:procedure])
    @procedure.patient = Patient.find(params[:patient_id])
    @procedure.save
    redirect_to patient_path(@procedure.patient)
  end

  def update
    @procedure.update_attributes(params[:procedure])
    redirect_to patient_path(@procedure.patient)
  end

  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end
end
