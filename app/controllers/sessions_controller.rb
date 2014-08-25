class SessionsController < ApplicationController

  def new
    # binding.pry
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    # binding.pry

    if user && user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to root_path
    else
      # binding.pry
      flash[:error] = "There's something wrong with your username or password"
      redirect_to login_path
    end
  end

  def destroy
    flash[:notice] = "You have been logged out."
    session[:user_id] = nil
    redirect_to root_path
  end

end
