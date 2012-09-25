class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    render :follow
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    render :follow   
  end
  
  
end
