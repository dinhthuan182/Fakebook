class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, except: [:index, :new, :create, :delete_image_attachment]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @album = Album.new
    @images = @album.image_albums.build
    @album.user = current_user
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user

    respond_to do |format|
      if @album.save
        params[:image_albums]['image'].each do |a|
          @image_album = @album.image_albums.create!(:image => a)
        end
        format.html { redirect_to current_user, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: current_user }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        unless params[:image_albums]['image'].empty?
          params[:image_albums]['image'].each do |a|
            @image_album = @album.image_albums.create!(:image => a)
          end
        end

        format.html { redirect_to current_user, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    @image = ImageAlbum.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.html {redirect_back(fallback_location: request.referer)}
      format.js
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :description, :sharing_mode, image_albums_attributes: [:id, :album_id, :image])
    end
end
