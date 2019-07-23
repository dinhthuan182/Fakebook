class Album < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many_attached :images

  scope :published_album, -> {
    where(sharing_mode: true)
  }
end
