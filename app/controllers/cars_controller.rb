class CarsController < ApplicationController
  def index
    @car = Car.new
    @cars = Car.all
  end
end
