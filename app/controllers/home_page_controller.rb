class HomePageController < ApplicationController
  before_action :authenticate_user!
  def feeds
    @photos = Photo.except(current_user).all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @albums = Album.except(current_user).all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def discovers

  end
end
