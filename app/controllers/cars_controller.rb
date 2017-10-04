class CarsController < ApplicationController
  def index
    @search = Car.ransack(params[:q])
    @cars = @search.result.where(["status = :status", {status: 'Approved'}])

  end

  def carsforapproval
    @cars = Car.where(["status = :status", {status: 'Unapproved'}])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car= Car.new(car_params)
    if @car.save
      redirect_to '/cars'
    else
      render 'new'
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      render 'edit'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
      redirect_to '/cars'
  end

  private
  def car_params
    params.require(:car).permit(:manufacturer, :model, :style, :hourly_rate, :location, :status, :license_plate)
  end

  public


end

