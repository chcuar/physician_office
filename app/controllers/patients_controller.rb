class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  # anything that requires the id
  def index
    @patient = Patient.all
  end
  def show
    # don’t need because of the before action
  end
  def new
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end
  def edit
    # dont need because of the before action
  end
  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end
 def destroy
   @patient.destroy
   redirect_to patients_path
 end
 
 
   private
   def patient_params
     params.require(:patient).permit(:name, :age, :phone_number)
   end
 
   def set_patient
     @patient = Patient.find(params[:id])
     # this grabs which id you are currently selecting
   end
 
 end
