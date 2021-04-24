class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cookings, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destory
  has_many :like_cookings, through: :likes, sources: :cooking
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
 with_options presence: true do
    validates :nickname
    validates :email
    validates :sex
    validates :cooking_experience

  with_options format: { with: VALID_PASSWORD_REGEX }, length: {minimum: 6} do
    validates :password
  end
  
 end
end
