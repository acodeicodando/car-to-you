FactoryBot.define do
  factory :car do
    car_model { "Palio 1.0 ECONOMY Fire Flex 8V 4p" }
    car_model_id { 4828 }
    brand { "Fiat" }
    brand_id { 21 }
    lisence_plate { "RIO2A18" }
    car_model_year { "2015-08-01" }
    car_year_manufacture { 2013 }
  end
end
