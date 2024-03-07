class CarWashesController < ApplicationController
  before_action :set_car_wash, only: %i[show destroy]

  def new
    @car_wash = CarWash.new
  end

  def create
    @car_wash = CarWash.new(car_wash_params)
    @car_wash.user = current_user
    if @car_wash.save
      redirect_to car_wash_path(@car_wash)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @car_washes = CarWash.all
  end

  def show
  end

  def destroy
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
