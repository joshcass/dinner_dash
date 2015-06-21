class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  skip_before_action :current_user?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new valid_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome to your new Bluer Bottle Coffee account."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
  end

  def update
    if @user.update valid_params
      redirect_to @user, notice: "Account settings updated."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :show
    end
  end

  private

  def set_user
    @user = current_user
  end

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
