class Admin::CategoriesController < Admin::BaseController
  skip_before_action :require_user, only: [:show]

  def create
    @category = Category.new(valid_params)

    if @category.save
      redirect_to admin_user_path(current_user), notice: "Category Created"
    else
      flash.now[:errors] = @category.errors.full_messages.join(", ")
      render 'admin/users/show'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def valid_params
    params.require(:category).permit(:name)
  end
end
