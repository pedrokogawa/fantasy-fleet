# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
puts "Deleting Previous Reviews"
Review.destroy_all
puts "Deleting Previous Bookings"
Booking.destroy_all
puts "Deleting Previous Users"
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
puts "Deleted Users"
puts "Creating New users..."
User.create!(
  [
    {
      email: "admin@gmail.com",
      first_name: "Admin",
      last_name: "admin",
      nickname: "admin",
      license_number: nil,
      birthday: "1991-09-09",
      password: "123456",
      password_confirmation: "123456"
},
    {
      email: "penn@gmail.com",
      first_name: "Penn",
      last_name: "Junior",
      nickname: "quan",
      license_number: "Jwagon000",
      birthday: "1997-01-13",
      password: "123456",
      password_confirmation: "123456"
},
    {
      email: "pedro@gmail.com",
      first_name: "Pedro",
      last_name: "Kogawa",
      nickname: "Henrique",
      license_number: "pedro000",
      birthday: "2024-07-16",
      password: "123456",
      password_confirmation: "123456"
},
    {
      email: "shingie@gmail.com",
      first_name: "Shingie",
      last_name: "San",
      nickname: "Shin",
      license_number: "342352",
      birthday: "1979-07-16",
      password: "123456",
      password_confirmation: "123456"
},
    {
      email: "rei@gmail.com",
      first_name: "Rei",
      last_name: "Zhang",
      nickname: "ReiSan",
      license_number: "845902",
      birthday: "1978-10-16",
      password: "123456",
      password_confirmation: "123456"
}
  ]
)

# Creating 20 vehicles without photos
puts "Destroying all Vehicles"
Vehicle.destroy_all
puts "Destroyed Vehicles"

# !!!!! BOOKINGS DELETE ALL !!!!!! 
puts "Deleting all Bookings"
Booking.destroy_all
puts "Deleted Bookings."

puts "Seeding first 20 vehicles..."
vehicle1 = Vehicle.create!(
  name: "BumbleBee",
  category: "Car",
  seats: 4,
  speed: 350,
  price_per_day: 120000,
  description:"Rent the iconic Bumblebee car, a stunning 2010 Chevrolet Camaro, perfect for any occasion. This bright yellow muscle car with bold black racing stripes offers a sleek, modern design combined with powerful performance. Its aggressive stance and aerodynamic lines turn heads wherever it goes.",
  location: "Horikiri, Metropolitan Road 449, Yanagihara 1-chome, Yanagihara, Adachi, Tokyo, 120-0023, Japan",
  availability: "available",
  user_id: 1
)
image1 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444766/Lamborghini_Urus_qr1xw4.jpg")
puts "created #{vehicle1.name}"
vehicle2 = Vehicle.create!(

  name: "BatMotor",
  category: "Bicycle",
  seats: 2,
  speed: 250,
  price_per_day: 90000,
  description: "Powered by a high-performance engine, the Batman Bike delivers an exhilarating ride with exceptional speed, agility, and handling. Its cutting-edge technology includes a state-of-the-art navigation system, advanced lighting, and a robust braking system to ensure a safe and thrilling experience.",
  location: "Kita-Senju, Skytree Floor, Senju-asahicho, Senju asahi cho, Adachi, Tokyo, 120-0026, Japan",
  availability: "available",
  user_id: 1
)
image2 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444767/Black_super_bike_2024_auibfe.jpg")
puts "created #{vehicle2.name}"
vehicle3 = Vehicle.create!(
  name: "MonsterATV",
  category: "ATV",
  seats: 4,
  speed: 300,
  price_per_day: 75000,
  description: "Elevate your adventure with our ATV High-End Car Rental. Featuring a sleek design, premium interior, and powerful engine, this all-terrain vehicle excels on any surface. Enjoy advanced tech, including a high-definition touchscreen and GPS, along with top safety features. Perfect for luxury outings and thrilling escapades.",
  location: "Tochomae, Chuo-dori Avenue, Nishi-Shinjuku, Nishi Shinjuku 2, Nishi Shinjuku, Shinjuku, Tokyo, 163-8001, Japan",
  availability: "available",
  user_id: 1
)
image3 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444764/__11_o9f6qf.jpg")
puts "created #{vehicle3.name}"
vehicle4 = Vehicle.create!(
  name: "JokerTruck",
  category: "Truck",
  seats: 6,
  speed: 120,
  price_per_day: 20000,
  description: "Unleash excitement with our Joker Truck Rental. This striking, high-performance truck features a bold design inspired by the iconic Joker character. With powerful capabilities and a sleek, eye-catching exterior, it’s perfect for making a dramatic statement at events or on the road. Book now for a ride that’s both thrilling and unforgettable!",
  location: "Ogikubo, Ome Kaido, Kamiogi 1, Kamiogi, Suginami, Tokyo, 167-0032, Japan",
  availability: "available",
  user_id: 1
)
puts "test"
image4 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721457223/development/0bqher5khyjo0pjzqzmtkpu4yuje.avif")
puts "created #{vehicle4.name}"
vehicle5 = Vehicle.create!(
  name: "Scania",
  category: "Van",
  seats: 12,
  speed: 280,
  price_per_day: 110000,
  description: "Discover luxury with our Scania High-End Van Rental. This premium van offers exceptional comfort and style, featuring a sophisticated interior, advanced technology, and powerful performance. Ideal for executive travel or upscale group outings, it combines elegance with practicality for an unmatched driving experience. Book now for unparalleled sophistication and comfort!",
  location: "Ueno, Ueno Station, Higashiueno 3-chome, 東上野, Taito, Tokyo, 110-8716, Japan",
  availability: "available",
  user_id: 1
)
image5 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444764/__1_fb9bc3.jpg")
puts "created #{vehicle5.name}"
vehicle6 = Vehicle.create!(
  name: "CIABoat",
  category: "Boat",
  seats: 10,
  speed: 400,
  price_per_day: 200000,
  description: "Experience elite sophistication with our CIA High-End Boat Rental. This luxury vessel features a sleek, covert design and opulent interior, equipped with advanced navigation and high-end amenities. Ideal for discreet operations or exclusive events, it combines cutting-edge technology with unparalleled comfort. Book now for a journey in ultimate style.",
  location: "Minatomirai, Keyaki-dori Avenue, Minato Mirai, Nishi Ward, Yokohama, Kanagawa Prefecture, 231-0017, Japan",
  availability: "available",
  user_id: 1
)
image6 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444767/30_Car_Owners_That_Went_Too_Far_With_Dumb_Mods_For_Their_Cars_rgfkp9.jpg")
puts "created #{vehicle6.name}"
vehicle7 = Vehicle.create!(
  name: "BlackJet",
  category: "Airplane",
  seats: 25,
  speed: 600,
  price_per_day: 300000,
  description: "Elevate your travel with our Black Jet High-End Rental. This sleek, luxurious jet features a striking black exterior and a sumptuous interior with premium amenities. Equipped with state-of-the-art technology and offering exceptional performance, it’s perfect for high-profile trips and exclusive events. Experience unparalleled comfort and style in the skies.",
  location: "Haneda Airport, Bayshore Route, Hanedakuko 3-chome, Haneda Kukou, Ota, Tokyo, 144-0041, Japan",
  availability: "available",
  user_id: 1
)
image7 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444762/privatjet_c2wvar.avif")
puts "created #{vehicle7.name}"
vehicle8 = Vehicle.create!(
  name: "Celestia",
  category: "Spaceship",
  seats: 4,
  speed: 720,
  price_per_day: 800000,
  description: "Experience the pinnacle of luxury with our High-End White Spaceship Rental. This stunning vessel features a pristine white exterior and a lavish, futuristic interior with top-of-the-line amenities. Equipped with advanced technology for seamless space travel, it ensures a smooth, elegant journey. Perfect for high-profile missions or exclusive galactic adventures.",
  location: "Narita Airport Terminal 1, Kuko Nishi-dori, Furugome, Narita, Chiba Prefecture, 282-0004, Japan",
  availability: "available",
  user_id: 1
)
image8 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444762/spaceship_c9aysq.jpg")
puts "created #{vehicle8.name}"
vehicle9 = Vehicle.create!(
  name: "Mercedes85",
  category: "Car",
  seats: 2,
  speed: 550,
  price_per_day: 80000,
  description: "Discover luxury with our High-End Black Mercedes Car Rental. This sophisticated vehicle features a sleek black exterior and a refined interior with premium materials. Boasting advanced technology, exceptional performance, and a smooth, powerful ride, it’s perfect for making a bold statement at any event or during executive travel. Book now for unparalleled elegance.",
  location: "Tokyo International Cruise Terminal Station, Daiba Oumi Road, Aomi 2-chome, Aomi, Koto, Tokyo, 135-0064, Japan",
  availability: "available",
  user_id: 1
)
image9 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444766/Mercedes_qyvvnd.jpg")
puts "created #{vehicle9.name}"
vehicle10 = Vehicle.create!(
  name: "Panther",
  category: "Bicycle",
  seats: 1,
  speed: 850,
  price_per_day: 450000,
  description: "Unleash your inner thrill-seeker with our High-End Black Panther Motorcycle. This striking bike features a sleek black design and advanced performance engineering, combining a powerful engine with cutting-edge technology. Its luxurious finish and superior handling make it perfect for both city cruising and exhilarating rides. Book now for an unforgettable experience.",
  location: "Akihabara, JR, Kanda-Sakumacho 1-chome, Kanda-Sakumacho, Chiyoda, Tokyo, 101-0028, Japan",
  availability: "available",
  user_id: 1
)
image10 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444764/__10_xy7psk.jpg")
puts "created #{vehicle10.name}"
vehicle11 = Vehicle.create!(
  name: "LightningATV",
  category: "ATV",
  seats: 2,
  speed: 600,
  price_per_day: 60000,
  description: "Experience adrenaline-pumping luxury with our High-End Lightning ATV. Featuring a bold orange and black design, this top-tier all-terrain vehicle combines striking aesthetics with powerful performance. Its advanced suspension and robust engine ensure exceptional handling on any terrain. Perfect for those seeking style and power in their off-road adventures.",
  location: "Roppongi, Route 3 Shibuya Line, Roppongi 4-chome, Roppongi, Azabu, Minato, Tokyo, 106-0032, Japan",
  availability: "available",
  user_id: 1
)
image11 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444764/__15_fyy4z0.jpg")
puts "created #{vehicle11.name}"
vehicle12 = Vehicle.create!(
  name: "Millennium",
  category: "Truck",
  seats: 6,
  speed: 1050,
  price_per_day: 500000,
  description: "Experience unrivaled luxury with our High-End Black Truck Rental. This sleek, all-black truck boasts a sophisticated design, premium interior, and top-notch performance. Equipped with advanced technology and superior handling, it’s ideal for both executive travel and rugged terrains. Elevate your journey with a blend of elegance and power.",
  location: "Ikebukuro, Komachi dori, Ikebukuro 3-chome, Nishi-Ikebukuro 1-chome, Toshima, Tokyo, 171-0021, Japan",
  availability: "available",
  user_id: 1
)
image12 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444766/Mercedes_1_e97isi.jpg")
puts "created #{vehicle12.name}"
vehicle13 = Vehicle.create!(
  name: "PartyVan",
  category: "Van",
  seats: 20,
  speed: 320,
  price_per_day: 100000,
  description: "Transform your event with our High-End Black Party Van. Featuring a sleek black exterior and an opulent interior, this van is equipped with state-of-the-art sound systems, ambient lighting, and plush seating. Perfect for upscale parties and exclusive gatherings, it combines sophistication with entertainment. Make your next event unforgettable.",
  location: "Hachioji, Chuo Expressway, Oyamachi, Hachioji, Tokyo, 192-0032, Japan",
  availability: "available",
  user_id: 1
)
image13 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444763/__2_cpl7m1.jpg")
puts "created #{vehicle13.name}"
vehicle14 = Vehicle.create!(
  name: "GoingMerry",
  category: "Boat",
  seats: 25,
  speed: 200,
  price_per_day: 180000,
  description: "Embark on a luxury adventure with our High-End Luffy's Going Merry Rental. This meticulously crafted vessel combines the classic charm of the original with modern elegance. Featuring a stylish design, plush interiors, and top-tier amenities, it’s perfect for upscale cruises and exclusive events. Experience a legendary journey in ultimate comfort.",
  location: "Odaiba, ウエストプロムナード, Daiba 1-chome, Daiba, Minato, Tokyo, 135-8625, Japan",
  availability: "available",
  user_id: 1
)
image14 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721457241/development/tj8pkldpihcbcrrsn8myfni8zk3i.jpg")
puts "created #{vehicle14.name}"
vehicle15 = Vehicle.create!(
  name: "SpiderCopter",
  category: "Airplane",
  seats: 2,
  speed: 670,
  price_per_day: 830000,
  description: "Experience the future of luxury with our High-End Spidercopter Rental. This cutting-edge aircraft combines sleek, futuristic design with top-of-the-line performance. Equipped with advanced navigation systems and plush, high-tech interiors, it ensures a smooth, exhilarating flight. Perfect for exclusive travel and high-profile events, it offers an unparalleled airborne experience.",
  location: "Shinagawa, Minato, Tokyo, 108-8611, Japan",
  availability: "available",
  user_id: 1
)
image15 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444763/__13_hpc0xo.jpg")
puts "created #{vehicle15.name}"
vehicle16 = Vehicle.create!(
  name: "Aurora",
  category: "Spaceship",
  seats: 2,
  speed: 900,
  price_per_day: 62000,
  description: "Explore the cosmos in style with our High-End Orange Spaceship Rental. This striking vessel features a vibrant orange exterior and a luxurious, futuristic interior with advanced amenities. Equipped with state-of-the-art technology for smooth and sophisticated space travel, it’s perfect for exclusive galactic adventures. Elevate your journey with unparalleled elegance.",
  location: "Jiyugaoka, 女神広場, Jiyugaoka 2-chome, Meguro, Tokyo, 152-0035, Japan",
  availability: "available",
  user_id: 1
)
image16 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444763/__9_jrgxbw.jpg")
puts "created #{vehicle16.name}"
vehicle17 = Vehicle.create!(
  name: "Deluxo",
  category: "Car",
  seats: 2,
  speed: 300,
  price_per_day: 20000,
  description: "Discover sophistication with our High-End Gray Car Rental featuring side door opening. This sleek, gray luxury vehicle combines elegant design with cutting-edge technology and exceptional performance. The unique side door feature adds convenience and style, making it perfect for upscale events and effortless access. Experience comfort and refinement like never before.",
  location: "Asakusa, Edo-dori Avenue, Kaminarimon 2-chome, Taito, Tokyo, 111-0034, Japan",
  availability: "available",
  user_id: 2
)
image17 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721307981/development/qfqudd3jlt0lmd3m7q0918892wsm.jpg")
puts "created #{vehicle17.name}"
vehicle18 = Vehicle.create!(
  name: "Creamsen",
  category: "Airplane",
  seats: 4,
  speed: 450,
  price_per_day: 150000,
  description: "Experience the pinnacle of luxury with our High-End Red Ferrari Helicopter Rental. Featuring a striking red exterior and opulent interior, this helicopter combines Ferrari’s iconic design with advanced aviation technology. Enjoy an exhilarating flight with unparalleled comfort and style. Perfect for high-profile events or exclusive travel. Book now for a truly spectacular journey.",
  location: "Takadanobaba, Waseda-dori, Takadanobaba　2, Takadanobaba, Shinjuku, Tokyo, 167-0075, Japan",
  availability: "available",
  user_id: 3
)
image18 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444764/__12_rozicx.jpg")
puts "created #{vehicle18.name}"
vehicle19 = Vehicle.create!(
  name: "Valor",
  category: "Spaceship",
  seats: 2,
  speed: 1050,
  price_per_day: 450000,
  description: "Experience elite travel with our High-End Military Plane Rental. This advanced aircraft combines rugged military precision with luxurious amenities, featuring a sleek, tactical design and an opulent, fully-equipped interior. Ideal for high-profile missions or exclusive journeys, it offers unmatched performance and comfort. Elevate your airborne experience with sophistication and power.",
  location: "Ebisu, Komazawa-dori, Ebisu nishi 1, Ebisu nishi, Shibuya, Tokyo, 150-0022, Japan",
  availability: "available",
  user_id: 4
)
image19 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444766/GTA_5_-_B-11_Strikeforce_Test_Showcase_zaujxo.jpg")
puts "created #{vehicle19.name}"
vehicle20 = Vehicle.create!(
  name: "KnightBus",
  category: "Van",
  seats: 60,
  speed: 900,
  price_per_day: 400000,
  description: "Experience magical travel with our Knight Bus Rental, inspired by the iconic Harry Potter series. This whimsical, triple-decker bus features an enchanting design with a distinctive purple exterior and luxurious, spacious interiors. Equipped with comfortable seating and unique charm, it’s perfect for themed events or a fantastical journey. Book now for a truly magical ride.",
  location: "Harry Potter Mahou Dokoro, 1, Akasaka, Minato, Tokyo, 107-6328, Japan",
  availability: "available",
  user_id: 5
)
image20 = URI.open("https://res.cloudinary.com/dfiehvopq/image/upload/v1721444766/Knight-Bus_s0mtcr.jpg")
puts "created #{vehicle20.name}"

puts "Attaching photos"
vehicle1.photo.attach(io: image1, filename: "#{vehicle1.name}.jpg", content_type: "image/jpg")
vehicle2.photo.attach(io: image2, filename: "#{vehicle2.name}.jpg", content_type: "image/jpg")
vehicle3.photo.attach(io: image3, filename: "#{vehicle3.name}.jpg", content_type: "image/jpg")
vehicle4.photo.attach(io: image4, filename: "#{vehicle4.name}.jpg", content_type: "image/jpg")
vehicle5.photo.attach(io: image5, filename: "#{vehicle5.name}.jpg", content_type: "image/jpg")
vehicle6.photo.attach(io: image6, filename: "#{vehicle6.name}.jpg", content_type: "image/jpg")
vehicle7.photo.attach(io: image7, filename: "#{vehicle7.name}.jpg", content_type: "image/jpg")
vehicle8.photo.attach(io: image8, filename: "#{vehicle8.name}.jpg", content_type: "image/jpg")
vehicle9.photo.attach(io: image9, filename: "#{vehicle9.name}.jpg", content_type: "image/jpg")
vehicle10.photo.attach(io: image10, filename: "#{vehicle10.name}.jpg", content_type: "image/jpg")
vehicle11.photo.attach(io: image11, filename: "#{vehicle11.name}.jpg", content_type: "image/jpg")
vehicle12.photo.attach(io: image12, filename: "#{vehicle12.name}.jpg", content_type: "image/jpg")
vehicle13.photo.attach(io: image13, filename: "#{vehicle13.name}.jpg", content_type: "image/jpg")
vehicle14.photo.attach(io: image14, filename: "#{vehicle14.name}.jpg", content_type: "image/jpg")
vehicle15.photo.attach(io: image15, filename: "#{vehicle15.name}.jpg", content_type: "image/jpg")
vehicle16.photo.attach(io: image16, filename: "#{vehicle16.name}.jpg", content_type: "image/jpg")
vehicle17.photo.attach(io: image17, filename: "#{vehicle17.name}.jpg", content_type: "image/jpg")
vehicle18.photo.attach(io: image18, filename: "#{vehicle18.name}.jpg", content_type: "image/jpg")
vehicle19.photo.attach(io: image19, filename: "#{vehicle19.name}.jpg", content_type: "image/jpg")
vehicle20.photo.attach(io: image20, filename: "#{vehicle20.name}.jpg", content_type: "image/jpg")
puts "Attached ALL photos."

puts "SEEDS DONE!!!"
