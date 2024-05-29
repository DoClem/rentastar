# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
Booking.destroy_all

Celebrity.delete_all
User.destroy_all

puts "Creating users..."

user = User.create(email: 'utilisateur@example.com', password: 'mot_de_passe', first_name: 'prenom', last_name: 'nom')

puts "Creating celebrities..."

celebrities = [
  { first_name: 'Rihanna', last_name: 'lol', age: 36, address: 'London, England', price: 1500 },
  { first_name: 'Lewis', last_name: 'Hamilton', age: 39, address: 'London, England', price: 500 },
  { first_name: 'Peter', last_name: 'Dinklage', age: 54, address: 'New Jersey, USA', price: 100 },
  { first_name: 'Morgan', last_name: 'Freeman', age: 86, address: 'Memphis, USA', price: 700 },
  { first_name: 'Jack', last_name: 'Sparrow', age: 60, address: 'La Havane, Cuba', price: 3000 },
  { first_name: 'Marilyn', last_name: 'Monroe', age: 36,  address: 'California, USA', price: 2000 },
  { first_name: 'Kendall', last_name: 'Jenner', age: 28, address: 'California, USA', price: 1500 },
  { first_name: 'Dua', last_name: 'Lipa', age: 28, address: 'London, England', price: 1500 }
]

celebrities.each do |celebrity_data|
  Celebrity.create!(
    first_name: celebrity_data[:first_name],
    last_name: celebrity_data[:last_name],
    age: celebrity_data[:age],
    address: celebrity_data[:address],
    price: celebrity_data[:price],
    user: user
  )
end

puts "Completed!"
