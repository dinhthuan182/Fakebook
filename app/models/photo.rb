class Photo < ApplicationRecord

  has_attached_file :image
  validates_attachment :image,
    size: { less_than: 5.megabyte },
    :styles => { :medium => "210x210>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#Association
  belongs_to :user

  has_many :likes, as: :postable

#vaildates
  validates :title, :description, :image, presence: true
  validates :title , length: { maximum: 140 }
  validates :description , length: { maximum: 500 }

end
