class Vehicle < ApplicationRecord
  belongs_to :user_id
  has_one_attached :photo
end
