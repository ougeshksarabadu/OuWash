class AppointmentsController < ApplicationController

  def index
    @user = current_user
    @appointments = current_user.appointments

    # if current_user.owner
    #   @car_washes = CarWash.where(user_id: current_user.id)
    #   @car_washes.each do |car_wash|
    #     @appointments = Appointment.where(car_wash_id: car_wash.id)
    #   end
    # else
    #   @cars = Car.where(user_id: current_user.id)
    #   @cars.each do |car|
    #     @appointments = Appointment.where(car_id: car.id)
    #   end
    # end
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

  def approve
    @appointment = Appointment.find(params[:id])
    @appointment.approval = true
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :location)
  end
end
