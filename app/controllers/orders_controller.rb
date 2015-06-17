class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.add_order_items(@cart)
  end
end
