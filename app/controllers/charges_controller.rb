class ChargesController < ApplicationController
  def new
  end

  def create
    @order = Order.find(params[:order_id])
    @amount = @order.total_cost

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    if Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )

      @order.pay!
      NotificationMessage.new.order_status_update(@order.user.full_name, @order.user.phone, @order.status) if @order.user.phone?
      redirect_to user_path(current_user), notice: "Thanks for the payment!"
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
end
