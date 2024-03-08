class CarWashesController < ApplicationController
  before_action :set_car_wash, only: %i[show destroy]

  def new
    @car_wash = CarWash.new
  end

  def create
    @car_wash = CarWash.new(car_wash_params)
    @car_wash.user = current_user
    @car_wash.user.owner = true
    if @car_wash.save
      redirect_to car_wash_path(@car_wash)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if current_user.owner
      @car_washes = CarWash.where(user_id: current_user.id)
    else
      @car_washes = CarWash.all
    end
  end

  def show
  end

  def destroy
    @appointments = Appointment.where(car_wash_id: params[:id])
    @appointments.destroy_all
    @car_wash.destroy
    redirect_to car_washes_path
  end

  private

  def set_car_wash
    @car_wash = CarWash.find(params[:id])
  end

  def car_wash_params
    params.required(:car_wash).permit(:name, :price_sedan, :price_suv, :price_truck, :price_luxury, :location)
  end
end
