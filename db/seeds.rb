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


# 10.times do
#   Vehicle.create!(
#     name: Faker::Vehicle.make_and_model,
#     category: Faker::Vehicle.car_type,
#     seats: rand(2..6),
#     speed: rand(100..250),
#     price_per_day: rand(50..500),
#     description: Faker::Lorem.sentence,
#     location: Faker::Address.city,
#     availability: ['Available', 'Unavailable']
#   )
# end
# puts "created models"

# Creation of users.
User.create!(
  [
    {
      email: "john@gmail.com",
      first_name: "John",
      last_name: "Doe",
      nickname: nil,
      license_number: nil,
      birthday: "1991-09-09",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "marcel@gmail.com",
      first_name: "Marcel",
      last_name: "Ribeiro",
      nickname: nil,
      license_number: nil,
      birthday: "1991-01-01",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "pedro@gmail.com",
      first_name: "Pedro",
      last_name: "Henrique",
      nickname: "",
      license_number: nil,
      birthday: "2024-07-16",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "ken@gmail.com",
      first_name: "Ken",
      last_name: "San",
      nickname: "",
      license_number: nil,
      birthday: "1979-07-16",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "maria@gmail.com",
      first_name: "Maria",
      last_name: "Helena",
      nickname: "",
      license_number: nil,
      birthday: "1978-10-16",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "rose@gmail.com",
      first_name: "Rose",
      last_name: "San",
      nickname: "TheRose",
      license_number: 43214321,
      birthday: "2004-07-16",
      password: "123456",
      password_confirmation: "123456"
    }
  ]
)
 
# Creating 20 vehicles without photos
Vehicle.create!(
  [
    {
      name: "Kaneda's Bike",
      category: "Motorcycle",
      seats: 2,
      speed: 243,
      price_per_day: 50000,
      description: "Kaneda's iconic red motorcycle from the anime \"Akira,\" known for its sleek design and incredible speed. A symbol of the cyberpunk genre and futuristic aesthetics.",
      location: "Tokyo",
      availability: "available",
      user_id: 3
    },
    {
      name: "Batmobile",
      category: "Car",
      seats: 2,
      speed: 350,
      price_per_day: 100000,
      description: "The Batmobile is Batman's primary mode of transportation, equipped with advanced technology, weapons, and high-speed capabilities. It is a symbol of Batman's fight against crime in Gotham City.",
      location: "Gotham City",
      availability: "available",
      user_id: 3
    },
    {
      name: "Gantz Monobike",
      category: "Motorcycle",
      seats: 1,
      speed: 300,
      price_per_day: 75000,
      description: "A Gantz Bike, ou Gantz Monobike, é uma motocicleta futurista de uma única roda usada pelos personagens do anime e mangá \"Gantz\". Conhecida por sua alta velocidade e design inovador, é uma peça-chave no arsenal dos personagens.",
      location: "Tokyo",
      availability: "available",
      user_id: 3
    },
    {
      name: "Capsule Corp Spaceship",
      category: "Spaceship",
      seats: 4,
      speed: 50000,
      price_per_day: 200000,
      description: "The Capsule Corp Spaceship, also known as the Capsule Corp Orb, is a large spacecraft used by Goku in the Dragon Ball series for training and interstellar travel. It features advanced technology and a gravity chamber for intense training sessions.",
      location: "West City",
      availability: "available",
      user_id: 3
    },
    {
      name: "Catbus",
      category: "Bus",
      seats: 12,
      speed: 100,
      price_per_day: 150000,
      description: "The Catbus is a magical, living bus from Studio Ghibli's \"My Neighbor Totoro.\" It has the appearance of a giant cat and can travel quickly and magically, providing a whimsical and unique transportation experience. It is known for its ability to appear and disappear, and for its friendly, helpful nature.",
      location: "Rural Japan",
      availability: "available",
      user_id: 3
    },
    {
      name: "Flintmobile",
      category: "Car",
      seats: 4,
      speed: 15,
      price_per_day: 2000,
      description: "The Flintmobile is the iconic foot-powered car from the animated series \"The Flintstones.\" It features a stone chassis and wooden roller wheels, and is powered by the feet of its passengers. This unique vehicle is a symbol of the prehistoric lifestyle of the Flintstones and their neighbors.",
      location: "Bedrock",
      availability: "available",
      user_id: 1
    },
    {
      name: "Test Vehicle",
      category: "Car",
      seats: 1,
      speed: 100,
      price_per_day: 1000,
      description: "A test vehicle",
      location: "Tokyo",
      availability: "available",
      user_id: 1
    },
    {
      name: "Ecto-1",
      category: "Car",
      seats: 4,
      speed: 120,
      price_per_day: 8000,
      description: "The Ecto-1 is the iconic car from Ghostbusters, equipped with various ghost-hunting gear and known for its distinctive siren.",
      location: "New York City",
      availability: "available",
      user_id: 3
    },
    {
      name: "Luigi Kart",
      category: "Go-Kart",
      seats: 1,
      speed: 80,
      price_per_day: 4000,
      description: "Luigi's go-kart from the Mario Kart series, known for its agility and balanced performance.",
      location: "Mushroom Kingdom",
      availability: "available",
      user_id: 3
    },
    {
      name: "Mario Kart",
      category: "Go-Kart",
      seats: 1,
      speed: 85,
      price_per_day: 4500,
      description: "Mario's go-kart from the Mario Kart series, famous for its speed and versatility.",
      location: "Mushroom Kingdom",
      availability: "available",
      user_id: 3
    },
    {
      name: "Lightning McQueen",
      category: "Car",
      seats: 2,
      speed: 200,
      price_per_day: 15000,
      description: "Lightning McQueen, the famous race car from the movie Cars, known for his speed and competitive spirit.",
      location: "Radiator Springs",
      availability: "available",
      user_id: 3
    },
    {
      name: "Millennium Falcon",
      category: "Spaceship",
      seats: 6,
      speed: 1050,
      price_per_day: 500000,
      description: "The Millennium Falcon is a legendary spaceship from Star Wars, piloted by Han Solo and known for its incredible speed and agility.",
      location: "Galaxy Far Far Away",
      availability: "available",
      user_id: 3
    },
    {
      name: "Flying Nimbus",
      category: "Cloud",
      seats: 1,
      speed: 300,
      price_per_day: 10000,
      description: "The Flying Nimbus is a magical cloud from Dragon Ball, used by Goku for swift and nimble travel.",
      location: "Mount Paozu",
      availability: "available",
      user_id: 3
    },
    {
      name: "Going Merry",
      category: "Ship",
      seats: 10,
      speed: 30,
      price_per_day: 200000,
      description: "The Going Merry is the first ship of the Straw Hat Pirates in One Piece, known for its distinctive figurehead and adventurous voyages.",
      location: "Grand Line",
      availability: "available",
      user_id: 3
    },
    {
      name: "Optimus Prime",
      category: "Truck",
      seats: 2,
      speed: 120,
      price_per_day: 100000,
      description: "Optimus Prime is the leader of the Autobots in Transformers, able to transform from a truck to a powerful robot.",
      location: "Cybertron",
      availability: "available",
      user_id: 3
    },
    {
      name: "Mystery Machine",
      category: "Van",
      seats: 5,
      speed: 90,
      price_per_day: 6000,
      description: "The Mystery Machine is the van used by the Scooby-Doo gang to travel and solve mysteries.",
      location: "Coolsville",
      availability: "available",
      user_id: 3
    },
    {
      name: "Mach 5",
      category: "Car",
      seats: 2,
      speed: 300,
      price_per_day: 20000,
      description: "The Mach 5 is Speed Racer's car, equipped with various gadgets and known for its incredible speed.",
      location: "Race Track",
      availability: "available",
      user_id: 3
    },
    {
      name: "War Rig",
      category: "Truck",
      seats: 2,
      speed: 100,
      price_per_day: 150000,
      description: "The War Rig is the massive truck driven by Furiosa in Mad Max: Fury Road, designed for combat and survival in the wasteland.",
      location: "The Wasteland",
      availability: "available",
      user_id: 3
    },
    {
      name: "X-Wing",
      category: "Spaceship",
      seats: 1,
      speed: 1050,
      price_per_day: 450000,
      description: "The X-Wing is a starfighter used by the Rebel Alliance in Star Wars, known for its speed and combat capabilities.",
      location: "Galaxy Far Far Away",
      availability: "available",
      user_id: 3
    },
    {
      name: "Y-Wing",
      category: "Spaceship",
      seats: 1,
      speed: 900,
      price_per_day: 400000,
      description: "The Y-Wing is a bomber used by the Rebel Alliance in Star Wars, known for its durability and heavy firepower.",
      location: "Galaxy Far Far Away",
      availability: "available",
      user_id: 3
    }
  ]
)

