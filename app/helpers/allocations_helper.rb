module AllocationsHelper
  def allocation_id(allocation)
    @allocation_id ||= allocation.try(:id)
  end

  def get_cars
    @get_cars ||= Car.order(brand: :asc, model: :asc, model_year: :asc).pluck(:fipe_code, :id)
  end
end
