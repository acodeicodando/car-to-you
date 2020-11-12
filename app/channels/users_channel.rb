class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users_#{current_user.id}"
  end
end
