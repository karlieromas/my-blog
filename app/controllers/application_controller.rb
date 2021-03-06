class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def get_current_userid
    session[:user_id]
  end

  def logged_in?
    !!get_current_userid
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def authenticate!
    if !logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect '/login'
    end
  end
end
