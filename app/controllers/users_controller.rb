class UsersController < ApplicationController
  def index
    @users = User.order(updated_at: :desc)
    @user = User.new
  end

  def edit
  end
end
