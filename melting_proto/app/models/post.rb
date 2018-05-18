class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  #CarrierWave
  mount_uploader :image, PostImageUploader

end
