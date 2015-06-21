class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_item
  skip_before_action :current_user?

  def create
    @cart.add_item(@item.id, params[:quantity])
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(@item.id), @item.name)} in your cart."
    redirect_to items_path
  end


  def update
    @cart.update_item(@item.id, params[:quantity])
    flash[:notice] = "Your cart has been updated."
    redirect_to new_order_path
  end

  def destroy
    @cart.remove_item(@item.id)
    flash[:alert] = "Item removed from cart."
    redirect_to new_order_path
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
