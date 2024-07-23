class Review < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :rating, :title, presence: true
end
