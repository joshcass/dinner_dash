class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new valid_params
    if @user.save
      # session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome to your new Bluer Bottle Coffee account."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def valid_params
    params.require(:user).permit(
                                  :username,
                                  :password,
                                  :password_confirmation,
                                  :email,
                                  :first_name,
                                  :last_name,
                                  :display_name
    )
  end
end
