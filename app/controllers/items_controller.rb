class ItemsController < ApplicationController
  skip_before_action :current_user?, only: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @categories = Category.all
    @items = Item.active
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
