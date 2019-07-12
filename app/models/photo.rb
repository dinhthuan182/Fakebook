class Photo < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_one_attached :image

end
