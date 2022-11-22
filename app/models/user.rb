class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :rents, dependent: :destroy
  #has_many :reviews, through: :rents, dependent: :destroy

  validates :email, confirmation: true
end
