class Photo < ApplicationRecord

  has_attached_file :image
  validates_attachment :image,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 5.megabyte }
#Association
  belongs_to :user

  has_many :likes, as: :postable

#vaildates
  validates :title, :description, :image, presence: true
  validates :title , length: { maximum: 140 }
  validates :description , length: { maximum: 500 }
  # validates :validates_uploadfile() on: "create"

  # def validates_uploadfile(file)
  #   max_size = 5120
  #   errors.add(:uploadfile, "File size exceeds limitation") if file.size > max_size
  #   file.to_s.include?(".gif") or file.to_s.include?(".png") or file.to_s.include?(".jpg") or file.to_s.include?(".jpeg")
  # end
end
