# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "Destroying all Vehicles"
Vehicle.destroy


10.times do
  Vehicle.create!(
    name: Faker::Vehicle.make_and_model,
    category: Faker::Vehicle.car_type,
    seats: rand(2..6),
    speed: rand(100..250),
    price_per_day: rand(50..500),
    description: Faker::Lorem.sentence,
    location: Faker::Address.city,
    availability: ['Available', 'Unavailable']
  )
end
puts "created models"
