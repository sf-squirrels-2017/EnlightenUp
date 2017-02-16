class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    @appointments = Appointment.all
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = appointment.new(article_params)
    if @appointment.save
      redirect_to appointments_path(@appointment)
    else
       render :new
    end
  end

  
  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end
    
  private

  def appointment_params
    params.require(:appointment).permit(:student, :mentor, :start_time, :topic)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end