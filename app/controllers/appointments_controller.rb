class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]


  def index
    @appointments = @physician.appointments
  end

  def show
  end

  def new
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_path(@physician.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to physician_path(@physician.id)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to physician_path(@physician.id)
  end

  private

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :physician_id, :patient_id)
  end
  
end