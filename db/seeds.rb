require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rent.destroy_all
Product.destroy_all
User.destroy_all

# For a fresh start run:
# rake db:reset db:seed

# 'Real' users seeding:
puts "Creating Users..."
User.create(
  first_name: "João", last_name: "Alberto",
  description: "Art Connaisseur", email: "joao.alberto@hotmail.com",
  password: "123456", admin: false
)

User.create(
  first_name: "Jorge", last_name: "Guimarães",
  description: "Art Curious", email: "jorge@hotmail.com",
  password: "123456", admin: true
)

User.create(
  first_name: "Francisco", last_name: "Patricio",
  description: "Crypto Guy", email: "francisco@hotmail.com",
  password: "123456", admin: true
)

User.create(
  first_name: "Manuel", last_name: "Esteves",
  description: "Nice Guy", email: "manuel@hotmail.com",
  password: "123456", admin: true
)

User.create(
  first_name: "Georgina", last_name: "Guimarães",
  description: "Art Curious", email: "georgina@hotmail.com",
  password: "123456", admin: false
)

User.create(
  first_name: "Francisca", last_name: "Patricio",
  description: "Crypto Gal", email: "francisca@hotmail.com",
  password: "123456", admin: false
)

User.create(
  first_name: "Manuela", last_name: "Esteves",
  description: "Multimillionaire", email: "manuela@hotmail.com",
  password: "123456", admin: false
)

puts "Creating Products..."
product = Product.new(
  name: "Diamond Necklace",
  description: "Family Inherited",
  min_rent_duration: 5,
  weight: 200,
  material: "gold", # %w[gold silver platinum]
  product_price: 50_000,
  rent_cost: 350,
  user: User.find_by(first_name: 'Francisco'),
  city: "Matosinhos",
  state: "Porto"
)
file = URI.open("https://res.cloudinary.com/dj3nqzpwh/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1669284146/h3axbah0jdfl3yhahs7o.jpg")
product.photo.attach(io: file, filename: "h3axbah0jdfl3yhahs7o.jpg", content_type: "image/jpg")
product.save

product = Product.new(
  name: "Rapper Chain",
  description: "Rapper Chain",
  min_rent_duration: 1,
  weight: 350,
  material: "platinum",
  product_price: 500_000,
  rent_cost: 350,
  user: User.find_by(first_name: 'Jorge'),
  city: "Alverca",
  state: "Lisboa"
)
file = URI.open("https://res.cloudinary.com/dj3nqzpwh/image/upload/v1669283097/vwmjssfxxuepa3ws1btm.jpg")
product.photo.attach(io: file, filename: "vwmjssfxxuepa3ws1btm.jpg", content_type: "image/jpg")
product.save

product = Product.new(
  name: "Detailed Necklace",
  description: "Wedding Necklace",
  min_rent_duration: 1,
  weight: 100,
  material: "gold", # %w[gold silver platinum],
  product_price: 100_000,
  rent_cost: 500,
  user: User.find_by(first_name: 'Manuela'),
  city: "Famalicão",
  state: "Braga"
)
file = URI.open("https://res.cloudinary.com/dj3nqzpwh/image/upload/v1669284146/h3axbah0jdfl3yhahs7o.jpg")
product.photo.attach(io: file, filename: "h3axbah0jdfl3yhahs7o.jpg", content_type: "image/jpg")
product.save

puts "Creating Rents..."
rent = Rent.new(
  user: User.find_by(first_name: 'Francisco'),
  product: Product.find_by(name: 'Rapper Chain'),
  duration: 2,
  credit_card: "5785 4451 7784 3225",
  approval_state: "Pending"
)
rent.total_value = rent.duration * rent.product.rent_cost
rent.save

rent = Rent.create(
  user: User.find_by(first_name: 'Jorge'),
  product: Product.find_by(name: 'Detailed Necklace'),
  duration: 7,
  credit_card: "7841 4451 1544 3254",
  approval_state: "Approved"
)
rent.total_value = rent.duration * rent.product.rent_cost
rent.save
