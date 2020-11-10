class UsersReflex < ApplicationReflex
  delegate :current_user, to: :connection
  include CableReady::Broadcaster
  before_reflex do
    if element.dataset["user-id"].present?
      @user = User.find(element.dataset["user-id"])
    elsif user_params[:id].present?
      @user = User.find(user_params[:id])
    else
      @user = User.new
    end
  end

  def edit
    morph :nothing
      partial_html = UsersController.render(partial: 'form', locals: { user: @user })
      cable_ready["users"].inner_html(
        selector: "#form-users",
        html: partial_html
      )
      cable_ready.broadcast

  end

  def save
    morph :nothing
      @user.attributes = user_params
      if @user.save
        partial_html = UsersController.render(partial: 'user', locals: { user: @user })

        if @user.new_record?
          cable_ready["users"].insert_adjacent_html(
            position: 'afterbegin',
            selector: '#users',
            html: partial_html
          )
        else
          cable_ready["users"].inner_html(
            selector: "#user-#{@user.id}",
            html: partial_html
          )
        end
        cable_ready.broadcast

        partial_html = UsersController.render(partial: 'form', locals: { user: User.new })
        cable_ready["users"].inner_html(
          selector: "#form-users",
          html: partial_html
        )
        cable_ready.broadcast
      else
        broadcast_error_messages
      end

  end



  def destroy
    morph :nothing
    if @user
      cable_ready["users"].remove(
        selector: "#user-#{@user.id}"
      )
      cable_ready.broadcast
      @user.destroy
    else
    end
  end

  private
    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
    end

    def broadcast_error_messages
      partial_html = UsersController.render(partial: 'form', locals: { user: @user })
      cable_ready["users"].inner_html(
        selector: "#form-users",
        html: partial_html
      )
      cable_ready.broadcast
    end
end
