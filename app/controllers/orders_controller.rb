class OrdersController < ApplicationController
  skip_before_action :current_user?, only: [:new]

  def new
    @order = Order.new
    @order.add_order_items(@cart)
  end
end
