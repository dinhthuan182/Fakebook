class HomePageController < ApplicationController
  def feeds
    @photos = Photo.except(current_user)
    @albums = Album.except(current_user)
  end

  def discovers

  end

  # def photo_modal
  #   @photo = Photo.find(params(:id))
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

# def album_modal

#   respond_to do |format|
#     format.html { redirect_to @user }
#     format.js
#   end
# end
end
