require 'net/http'
require 'json'
module FipeApi
  extend ActiveSupport::Concern

  def get_brands
    url = 'http://fipeapi.appspot.com/api/1/carros/marcas.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
