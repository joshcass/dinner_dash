class Admin::ItemsController < Admin::BaseController
  skip_before_action :require_user, only: [:index, :show]
  before_action :set_item, only: [:show, :update]

  def index
    @items = Item.active
  end

  def create
    @item = Item.new_and_add_categories(valid_params)

    if @item.save
      redirect_to admin_user_path(current_user), notice: "Item Created"
    else
      flash.now[:errors] = @item.errors.full_messages.join(", ")
      render 'admin/users/show'
    end
  end

  def show
  end

  def update
    if @item.update(valid_params)
      redirect_to admin_user_path(current_user), notice: "Item Updated"
    else
      flash.now[:errors] = @item.errors.full_messages.join(", ")
      redirect_to admin_item_path(@item)
    end
  end

  private

  def valid_params
    params.require(:item).permit(:name, :description, :price, :overview, :details, :categories, :image, :status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
