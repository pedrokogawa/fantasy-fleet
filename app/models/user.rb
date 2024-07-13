class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_vendor, through: :vehicles, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
