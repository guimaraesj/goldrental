class Rent < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :reviews # the rent user and the supplier user

  validates :duration, numericality: { only_integer: true }

  # is unique for a given product/user couple:
  validates_uniqueness_of :product_id, scope: :user_id
end
