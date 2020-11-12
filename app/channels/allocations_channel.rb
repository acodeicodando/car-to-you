class AllocationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "allocations"
  end
end
