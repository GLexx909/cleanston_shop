# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def create_user
  return if User.any?

  User.create(
    email_address: 'user@example.com',
    password: 'password',
  )

  p "Created #{User.count} users"
end

def create_products
  return if Product.any?

  Product.insert_all([
    { name: 'Беспроводная колонка Goodyear Bluetooth Speaker', quantity: 3, price: 1_600 },
    { name: 'Женский домашний костюм Sweet Dreams', quantity: 2, price: 800 },
    { name: 'Плащ-дождевик SwissOak', quantity: 2, price: 400 }
  ])

  p "Created #{Product.count} products"
end

create_user
create_products
