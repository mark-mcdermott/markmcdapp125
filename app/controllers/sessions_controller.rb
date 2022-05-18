class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: 'failed login', status: :unprocessable_entity }
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
