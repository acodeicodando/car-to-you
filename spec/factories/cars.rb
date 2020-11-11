FactoryBot.define do
  factory :car do
    name { "Palio 1.0 ECONOMY Fire Flex 8V 4p" }
    brand { "Fiat" }
    brand_id { 21 }

    model { "Palio 1.0 ECONOMY Fire Flex 8V 4p" }
    model_id { 4828 }

    fipe_id { "2013-1" }
    fipe_code { "Palio 1.0 ECONOMY Fire Flex 8V 4p :: 2014 Gasolina" }

    lisence_plate { "RIO2A18" }
    model_year { "2015-08-01" }
    year_manufacture { 2013 }
  end
end
