class Review < ApplicationRecord
  belongs_to :rent

  # comment cannot be shorter than 6 characters:
  validates :comment, length: { minimum: 6 }
end
