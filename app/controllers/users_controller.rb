class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end


   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to :admin
     else
       render 'edit'
     end
   end

  def show
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to :admin
  end

  def followings
    @title = "Followings"
    @user  = User.find(params[:id])
    @users = @user.followings.paginate(page: params[:page])
    # render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    # render 'show_follow'
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :activated)
    end
end
