class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have added #{pluralize(@cart.count_of(item.id), item.name)} to your cart."
    redirect_to items_path
  end
end
