class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_cart, :current_user?
  helper_method :logged_in?, :current_user

  def load_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user?
    redirect_to login_path, notice: "Login or Sign up!" unless logged_in?
  end

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end

