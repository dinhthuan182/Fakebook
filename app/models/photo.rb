class Photo < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image

  # def likes_by? user
  #   likes.exists? user: user
  # end
end
