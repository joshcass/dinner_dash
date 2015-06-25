class OmniauthSessionsController < ApplicationController
  skip_before_action :require_user

  def create
    user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if user.persisted?
      session[:user_id] = user.id
      redirect_to items_path
    else
      redirect_to login_path, alert: user.errors.full_messages.join(", ")
    end
  end
end
