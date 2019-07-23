class HomePageController < ApplicationController
  before_action :authenticate_user!
  def feeds
    @users = current_user.followings.ids
    @photos_feeds = Photo.where(user_id: @users).published_photo.paginate(page: params[:page], per_page: 10)
    @albums_feeds = Album.where(user_id: @users).published_album.paginate(page: params[:page], per_page: 10)
  end

  def discovers
    @photos_discovers = Photo.published_photo.where.not(user_id: current_user).paginate(page: params[:page], per_page: 10)
    @albums_discovers = Album.published_album.where.not(user_id: current_user).paginate(page: params[:page], per_page: 10)
  end
end