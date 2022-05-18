class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user 
  helper_method :logged_in?

  def authorized
    puts 'checking authorization status: ' + logged_in?.to_s
    redirect_to '/' unless logged_in?
  end

  def current_user
    @user = User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
end
