class HomePageController < ApplicationController
  def feeds
    @photos = Photo.except(current_user)
    @albums = Album.except(current_user)
  end

  def discovers

  end
end
