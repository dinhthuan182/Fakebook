class ImageAlbum < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :album
end
