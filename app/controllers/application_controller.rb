class ApplicationController < ActionController::Base
  # METHODS HERE AVAILABLE ONLY TO CONTROLLERS unless helper_method is used

  helper_method :current_user, :logged_in?

  def current_user
    # memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # returns true or false
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
