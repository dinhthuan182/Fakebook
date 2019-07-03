class Like < ApplicationRecord
#Association
  belongs_to :user
  belongs_to :postable, polymorphic: true
#Validates
end
