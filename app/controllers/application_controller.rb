class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def authenticate
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_user.is_a? User
  end
  helper_method :logged_in?

  def access_denied
    flash[:danger] = 'Please log in to continue'
    redirect_to login_path and return false
  end

end
