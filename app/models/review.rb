class Review < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :title, presence: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end