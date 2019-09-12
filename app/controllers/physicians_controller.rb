class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  # anything that requires the id
  def index
    @physicians = Physician.all
  end

  def show

  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to physicians_path
    else
      render :new
    end
  end

  def edit
    # dont need because of the before action
  end

  def update
    if @physician.update(physician_params)
      redirect_to root_path
    else
      render :edit
    end
  end

 def destroy
   @physician.destroy
   redirect_to physicians_path

 end
 
 
   private
   def physician_params
     params.require(:physician).permit(:name, :specialty)
   end
 
   def set_physician 
     @physician = Physician.find(params[:id])
     # this grabs which id you are currently selecting
   end

   def set_appointment
    @appointment = @physician.appointments
   end
 
 end
