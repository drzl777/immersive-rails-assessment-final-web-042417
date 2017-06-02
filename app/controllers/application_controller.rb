class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_player
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:danger] = "Please Log In to perform this action"
      redirect_to episodes_path
    end
  end
end
