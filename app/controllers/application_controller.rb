class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cart, :current_user?

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user?
    redirect_to login_path, notice: "Login or Sign up!" unless logged_in?
  end
end
