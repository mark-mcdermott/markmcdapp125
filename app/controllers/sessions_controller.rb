class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    flash[:error] = []
    @user = User.find_by(username: params[:username])
    if !@user
      flash[:error] = 'Invalid email'
    elsif !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:error] = 'Invalid password'
    end
      redirect_to '/login', error: flash[:error]
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
