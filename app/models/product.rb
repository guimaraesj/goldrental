class Product < ApplicationRecord
  #has_one_attached :photo # para o cloudinary
  belongs_to :user
  has_many :rents

  validates :name, :description, :min_rent_duration, :material, :rent_cost, :city, :state, presence: true
end
