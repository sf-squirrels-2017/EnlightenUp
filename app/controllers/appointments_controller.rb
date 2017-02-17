class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    @appointments = Appointment.order(:start_time)
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = session[:user_id]
    if @appointment.save
      redirect_to appointment_path(@appointment)
    end
  end
  
  def edit
    if session[:user_id] != nil
      @appointment = Appointment.find(params[:id])
    else
      redirect_to login_url
    end
  end

  def update
    if session[:user_id] != @appointment.mentor_id
      @user = User.find(session[:user_id])
      @appointment.update_attributes(student: @user)
      redirect_to appointment_path(@appointment)
    else
      @appointment.update_attributes(appointment_params)
      redirect_to appointment_path(@appointment)
    end
  end

    
  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :topic)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end