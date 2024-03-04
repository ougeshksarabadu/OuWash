class CarWashesController < ApplicationController
  def new
    @car_wash = Car_wash.new
  end

  def create
    @car_wash = Car_wash.new(car_wash_params)
    @car_wash.save
    redirect_to car_wash_path(@car_washes)
  end

  def index
    @car_washes = Car_wash.all
  end

  def show
    @car_wash = Car_wash.find(params {:id})
  end

  private

  def car_wash_params
    params.required(:car_wash).permit(:name, :price_sedan, :price_suv, :price_truck, :price_luxury)
  end

end
