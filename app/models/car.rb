class Car < ApplicationRecord
  validates :car_model, :car_model_id, :brand,
    :brand_id, :lisence_plate, :car_model_year,
    :car_year_manufacture, presence: true
  validates :car_model, uniqueness: {
    scope: [
      :car_model_id, :brand_id, :lisence_plate,
      :car_model_year, :car_year_manufacture
      ]
    }
end
