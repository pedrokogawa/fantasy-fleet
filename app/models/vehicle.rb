class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :price_per_day, :availability, :category, :description, presence: true
  validates :availability, inclusion: { in: [0, 1, 2]}
  validates :description, length: { maximum: 6 }
end
