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
require "open-uri"


Booking.destroy_all
Celebrity.destroy_all
User.destroy_all

puts "Creating users..."


user = User.create!(email: 'utilisateur@example.com', password: 'mot_de_passe', first_name: 'prenom', last_name: 'nom')

puts "Creating celebrities..."


celebrities = [
  { first_name: 'Rihanna', last_name: 'Fenty', age: 36, address: 'London, England', price: 1500, photo_url: "https://st.depositphotos.com/70843308/61314/i/450/depositphotos_613145842-stock-photo-barbadian-singer-rihanna-robyn-rihanna.jpg"},
  { first_name: 'Lewis', last_name: 'Hamilton', age: 39, address: 'London, England', price: 500, photo_url: "https://st.depositphotos.com/67536968/60918/i/450/depositphotos_609185242-stock-photo-lewis-hamilton-gbr-mercedes-w13.jpg"},
  { first_name: 'Peter', last_name: 'Dinklage', age: 54, address: 'New Jersey, USA', price: 100, photo_url: "https://tvline.com/wp-content/uploads/2019/05/game-of-thrones-series-finale-tyrion-lannister-peter-dinklage.jpg"},
  { first_name: 'Morgan', last_name: 'Freeman', age: 86, address: 'Memphis, USA', price: 700, photo_url: "https://st4.depositphotos.com/1729220/26816/i/600/depositphotos_268167702-stock-photo-morgan-freeman-arrivals-edison-premiere.jpg"},
  { first_name: 'Jack', last_name: 'Sparrow', age: 60, address: 'La Havane, Cuba', price: 300, photo_url: "https://images.unsplash.com/photo-1594189683218-b5a9a346a43f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"},
  { first_name: 'Marilyn', last_name: 'Monroe', age: 36, address: 'California, USA', price: 200, photo_url: "https://st.depositphotos.com/1125999/3955/i/450/depositphotos_39558539-stock-photo-marilyn-monroe.jpg"},
  { first_name: 'Kendall', last_name: 'Jenner', age: 28, address: 'California, USA', price: 1500, photo_url: "https://st4.depositphotos.com/3429495/38405/i/450/depositphotos_384054726-stock-photo-cannes-france-may-kendall-jenner.jpg"},
  { first_name: 'Dua', last_name: 'Lipa', age: 28, address: 'London, England', price: 1500, photo_url: "https://image-cdn.essentiallysports.com/wp-content/uploads/imago0258772444h.jpg"}
]


celebrities.each do |celebrity_data|
  file = URI.open(celebrity_data[:photo_url])
  celebrity = Celebrity.new(
    first_name: celebrity_data[:first_name],
    last_name: celebrity_data[:last_name],
    age: celebrity_data[:age],
    address: celebrity_data[:address],
    price: celebrity_data[:price],
    user: user
    )
  celebrity.photo.attach(io: file, filename: "#{celebrity_data[:first_name].downcase}_#{celebrity_data[:last_name].downcase}.jpg", content_type: "image/jpg")
  celebrity.save!


end

puts "Completed!"
