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

20.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Superhero.descriptor,
    email: Faker::Internet.safe_email,
    password: rand(654_564_612..987_984_784_894),
    admin: false
  )
  new_user.save!
  p "Created succefully"
end

20.times do
  new_product = Product.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    min_rent_duration: rand(1..90),
    weight: rand(1..500),
    material: %w[gold silver platinum].sample,
    product_price: rand(50..10_000),
    rent_cost: rand(50..2000),
    user: User.all.sample,
    city: Faker::Address.city,
    state: Faker::Address.state
  )
  new_product.save!
  p "Created product"

    new_rent = Rent.new(
      user: User.all.sample,
      product: new_product,
      duration: rand(50..1000),
      total_value: rand(50..10_000),
      credit_card: Faker::Finance.credit_card(:mastercard),
      approval_state: ["Pending", "Approved", "declined"].sample
    )
    new_rent.save!
    p "Created new rent"
