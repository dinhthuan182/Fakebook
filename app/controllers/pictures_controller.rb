class PicturesController < ApplicationController

  def destroy
    photo = Picture.find(params[:id])
    @id = photo.id
    photo.destroy
    respond_to :js
  end
end
