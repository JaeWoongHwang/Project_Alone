class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i   # 정규식을 이용해 이메일 형식을 지정
  validates :nickname, presence: true, length: {maximum: 50}               # 닉네임과 이메일이 반드시 존재하고 50,255자를 넘지 않게하는 유효성검사
  validates :email, presence: true, length: {maximum: 255},                # validates (존재를 확인), presence(오직 하나만 존재),
  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}   # uniqueness(이메일소문자)

  has_many :posts
end
