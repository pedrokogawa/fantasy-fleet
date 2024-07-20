class Vehicle < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :name, :price_per_day, :availability, :category, :description, presence: true
  validates :seats, numericality: { greater_than_or_equal_to: 1 }
  enum availability: { available: 0, unavailable: 1 }
  validates :description, length: { minimum: 6 }
end

