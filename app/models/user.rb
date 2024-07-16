class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_vendor, through: :vehicles, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validate :birthday_must_be_valid_date

  private

  def birthday_must_be_valid_date
    if birthday.present? && birthday <= Date.new(1900, 1, 1)
      errors.add(:birthday, "must be after January 1, 1900")
    end
  end
end
