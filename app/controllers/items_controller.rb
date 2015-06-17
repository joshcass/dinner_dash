class ItemsController < ApplicationController
  skip_before_action :current_user?, only: [:index]

  def index
    @categories = Category.all
    @items = Item.all
  end
end
