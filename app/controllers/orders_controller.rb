class OrdersController < ApplicationController
  skip_before_action :current_user?, only: [:new]

  def new
    @order = Order.new
    @order.add_order_items(@cart)
  end

  def create
    @order = Order.new
    @order.add_order_items(@cart)
    @order.user_id = session[:user_id]

    if @order.save
      @cart.remove_all
      redirect_to @order, notice: "Order Completed!"
    else
      flash.now[:errors] = @order.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
