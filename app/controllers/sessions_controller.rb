class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    Rails.logger.info user.inspect
    session[:user_id] = user.id
    redirect_to root_url
  end
end