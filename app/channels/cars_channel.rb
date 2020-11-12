class CarsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cars_#{current_user.id}"
  end
end
