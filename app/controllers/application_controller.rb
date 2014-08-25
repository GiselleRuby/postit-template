class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    # binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # binding.pry
  end

  def logged_in?
    # binding.pry
    !!current_user
    # binding.pry
    # User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    # binding.pry
    if !logged_in?
      flash[:error] = "You should logged in first..."
      redirect_to root_path
    end
  end

end
