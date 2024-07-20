class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :start_date, :end_date, :total_price, :status, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  enum status: { accepted: 0, waiting: 1, refused: 2, canceled: 3, completed: 4, ongoing: 5 }

  #automatically calculates # of days and TOTAL PRICE
  def total_price_calculation
    if end_date.nil? || start_date.nil? || start_date < Date.today
      self.total_price = 0
    else
      self.total_price = ((end_date - start_date).to_i + 1) * vehicle.price_per_day
    end
  end
end
