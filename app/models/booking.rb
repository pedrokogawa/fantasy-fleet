class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :start_day, :end_date, :total_price, :status, presence: true
  validates :end_date, comparison: { greater_than: :start_day }
  enum status: { accepted: 0, waiting: 1, recused: 2, canceled: 3, completed: 4, ongoing: 5 }
end
