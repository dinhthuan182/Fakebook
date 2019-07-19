class HomePageController < ApplicationController
  before_action :authenticate_user!
  def feeds
    @users = current_user.followings.ids
    @photos_feeds = Photo.where(user_id: @users).where(sharing_mode: true).paginate(page: params[:page], per_page: 10)
    @albums_feeds = Album.where(user_id: @users).where(sharing_mode: true).paginate(page: params[:page], per_page: 10)
  end

  def discovers
    @photos_discovers = Photo.where(sharing_mode: true).where.not(user_id: current_user).paginate(page: params[:page], per_page: 10)
    @albums_discovers = Album.where(sharing_mode: true).where.not(user_id: current_user).paginate(page: params[:page], per_page: 10)
  end
end