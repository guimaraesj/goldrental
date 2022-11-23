class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :name, :description, :min_rent_duration, :material, :rent_cost, :city, :state, presence: true
end
