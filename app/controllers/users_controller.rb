class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
