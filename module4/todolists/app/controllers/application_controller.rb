class ApplicationController < ActionController::Base
  before_action :ensure_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :logged_in?, :current_user
  protect_from_forgery with: :exception
  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def ensure_login
    redirect_to login_path unless logged_in?
  end
end
