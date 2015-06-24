class OrdersController < ApplicationController
  skip_before_action :require_user, only: [:new]

  def new
    @order = Order.new
    @order.add_order_items(@cart)
  end

  def create
    @order = Order.new
    @order.add_order_items(@cart)
    @order.user_id = session[:user_id]

    if @order.save
      NotificationMessage.new.order(current_user.full_name, current_user.phone, @order.total_cost) if current_user.phone?
      @cart.remove_all
      current_admin? ? redirect_to(admin_user_path(@order.user, notice: "Order Completed!")) : redirect_to(@order.user, notice: "Order Completed!")
    else
      flash.now[:errors] = @order.errors.full_messages.join(", ")
      render :new
    end
  end
end
