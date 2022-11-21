# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  new_product = Product.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    min_rent_duration: rand(1..90),
    weight: rand(1..500),
    material: %w[gold silver platinum].sample,
    product_price: rand(50..10_000),
    rent_cost: rand(50..2000),
    user: User.all.sample
  )
  new_product.save!
end

20.times do
  new_user = User.new(
    name: Faker::FunnyName.name_with_initial,
    description: Faker::Superhero.descriptor,
    localization: Faker::Address.city
  )
  new_user.save!
end

20.times do
  new_rent = Rent.new(
    user: User.all.sample,
    product: Product.all.sample,
    duration: Faker::Cannabis.brand,
    total_value: rand(50..1000),
    credit_card: Faker::Finance.credit_card(:mastercard),
    approval_state: rand(true, false)
  )
  new_rent.save!
end
