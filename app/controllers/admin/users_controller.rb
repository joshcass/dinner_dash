class Admin::UsersController < Admin::BaseController
  before_action :set_user

  def show
    @item = Item.new
    @category = Category.new
  end

  def update
    if @user.update valid_params
      redirect_to admin_user_path(@user), notice: "Account settings updated."
    else
      redirect_to admin_user_path(@user), alert: @user.errors.full_messages.join(", ")
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
