class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_param)

    if @user.save
      flash[:notice] = "Welcome, #{@user.username}"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:error] = @user.errors
      render :new
    end

  end

  def show
    # binding.pry
    # if params[:tab] == "comments"
    #   @comments = current_user.comments
    # else
    #   @posts = current_user.posts
    # end
  end

  def edit
    # binding.pry
  end

  def update
    # binding.pry

    # @user = User.update(user_param)

    if @user.update(user_param)
      flash[:notice] = "Your profile have been updated";
      redirect_to root_path
    else
      flash[:error] = @user.errors
      render :edit
    end
  end

  private

  def set_user
    # @user = current_user
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:username, :password)
  end
  
  def require_same_user
    if @user != current_user
      flash[:error] = "You are not allow to do that"
      redirect_to root_path
    end
  end
end
