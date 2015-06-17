class SessionsController < ApplicationController
  skip_before_action :current_user?, only: [:new, :create]
  
  def new
    session[:return_to] ||= request.referer
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to)
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
