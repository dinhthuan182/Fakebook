class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar
#Association
  has_many :photos
  has_many :albums
  has_many :likes

  has_many :active_follows, class_name: Follow.name, foreign_key: :follower_id
  has_many :following, through: :active_follow, source: :followed
  has_many :passive_follows, class_name: Follow.name, foreign_key: :followed_id
  has_many :follower, through: :active_follow

#validates
  validates :fname, :lname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :fname , :lname, length: { maximum: 25 }
  validates :email , length: { maximum: 255 }
  validates :password , length: { maximum: 64 }
  validates :password, confirmation: { case_sensitive: true }
  validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
