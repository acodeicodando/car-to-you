module CarsHelper

  def car_id(car)
    @car_id ||= car.try(:id)
  end

  def car_brand_id(car)
    @car_brand_id ||= car.try(:brand_id)
  end

  def car_model_id(car)
    @car_model_id ||= car.try(:model_id)
  end

  def car_fipe_id(car)
    @car_fipe_id ||= car.try(:car_fipe_id)
  end

  def get_brands
    @get_brands ||= Car.brands
  end

  def get_models(car)
    @get_models ||= Car.models(car_brand_id(car))
  end

  def get_fipe_models(car)
    @get_fipe_models ||= Car.fipe_models(car_brand_id(car), car_model_id(car))
  end

  def get_fipe_cars(car)
    @get_fipe_cars ||= Car.fipe_cars(car_brand_id(car), car_model_id(car), car_fipe_id(car))
  end
end
