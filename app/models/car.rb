class Car < ApplicationRecord
  default_scope { order(created_at: :desc) }

  validates :brand, :brand_id, :model, :model_id,
    :fipe_id, :fipe_code,
    :name, :lisence_plate,
    :year_manufacture, :model_year, presence: true
  validates :model, uniqueness: {
    scope: [
      :model_id, :brand_id, :name, :lisence_plate,
      :fipe_id, :year_manufacture, :model_year
      ]
    }

  def self.brands
    uri = URI('http://fipeapi.appspot.com/api/1/carros/marcas.json')
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    result = response.collect do|brand|
      [brand["name"], brand["id"]]
    end
    result
  end

  def self.models(brand_id)
    if brand_id.blank?
      return []
    else
      begin
        uri = URI("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        result = []
        response.each do |model|
          result << [model["name"], model["id"]]
        end
      rescue => exception
        result << "Error: #{exception.message}"
      end
      result
    end
  end

  def self.fipe_models(brand_id, model_id)
    if brand_id.blank? || model_id.blank?
      return []
    else
      begin
        result = []
        uri = URI("http://fipeapi.appspot.com/api/1/carros/veiculo/#{brand_id}/#{model_id}.json")
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response.each do |fipe_model|
          result << ["#{fipe_model["veiculo"]} :: #{fipe_model["name"]}", fipe_model["id"]]
        end
      rescue => exception
        result << "Error: #{exception.message}"
      end
      result
    end
  end

  def self.fipe_data(brand_id, model_id, fipe_id)
    uri = "http://fipeapi.appspot.com/api/1/carros/veiculo/#{brand_id}/#{model_id}/#{fipe_id}.json"
    result = []
    begin
      uri = URI(uri)
      response = Net::HTTP.get(uri)
      result = JSON.parse(response)
    rescue => exception
      logger.info exception.message
    end
    result
  end
end
