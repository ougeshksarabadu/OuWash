class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = Appointment.all
  end

  def show
    @car_wash = CarWash.find(params[:car_wash_id])
  end

  def new
    @appointment = Appointment.new
    @car_wash = CarWash.find(params[:car_wash_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.car_wash = CarWash.find(params[:car_wash_id])
    @appointment.car = Car.find(params[:appointment][:car])
    if @appointment.save
      redirect_to car_wash_appointments_path(@appointment.car_wash)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to car_wash_appointments_path(@appointment.car_wash)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :location)
  end
end
