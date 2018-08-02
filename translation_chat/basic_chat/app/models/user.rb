class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   before_save {self.email = email.downcase}
   validates :nickname, presence: true, length: {maximum: 100}
   validates :email, presence: true, length: {maximum: 255}

  has_many :posts
end
