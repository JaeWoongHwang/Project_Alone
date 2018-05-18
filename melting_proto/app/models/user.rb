class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  # 나를 팔로우 한 유저 가져오기
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower
  # 내가 팔로잉 한 유저 가져오기
  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed
  # CarrierWave
  mount_uploader :avatar, AvatarUploader

  # Check like
  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
