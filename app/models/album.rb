class Album < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many_attached :images
end
