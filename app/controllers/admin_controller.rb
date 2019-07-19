class AdminController < ApplicationController
  def index
    @photos = Photo.all.paginate(page: params[:page], per_page: 10)
    @albums = Album.all.paginate(page: params[:page], per_page: 10)
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end
end
