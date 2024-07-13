class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_vendor, through: :vehicles, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :birthday, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :birthday, date: { after: -> { Date.new(1900, 1, 1) } }
end
