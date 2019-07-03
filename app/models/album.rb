class Album < ApplicationRecord

#Association
  belongs_to :user
  has_many :likes, as: :postable
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
#vaildate
  validates :title, :description, :presence => true
end
