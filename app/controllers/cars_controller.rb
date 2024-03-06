class CarsController < ApplicationController
  before_action :set_car, only: %i[show]
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @cars = Car.all
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def show
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.required(:car).permit(:car_type, :brand, :year)
  end
end
