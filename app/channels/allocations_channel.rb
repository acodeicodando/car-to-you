class AllocationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "allocations_#{current_user.id}"
  end
end
