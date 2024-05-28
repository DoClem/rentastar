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

User.create(email: 'utilisateur@example.com', password: 'mot_de_passe', first_name: 'prenom', last_name: 'nom')

puts "Creating celebrities..."

10.times do
  celebrity = Celebrity.new(
    first_name: Faker::Artist.name,
    last_name: Faker::Artist.name,
    age: rand(19..99),
    category: Faker::Gender.type,
    address: Faker::Address.full_address,
    price: rand(1..100_00),
    user: User.first
  )
  celebrity.save!
end
puts "Completed!"
