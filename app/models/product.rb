class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rents

  validates :name, :description, :min_rent_duration, :material, :rent_cost, presence: true
end
