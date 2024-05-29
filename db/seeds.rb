# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'open-uri'
require_relative '../config/environment'


# Désactiver temporairement les contraintes de clé étrangère
ActiveRecord::Base.connection.execute("SET session_replication_role = replica;")

# Nettoyer la base de données
Celebrity.destroy_all

# Réactiver les contraintes de clé étrangère
ActiveRecord::Base.connection.execute("SET session_replication_role = DEFAULT;")

Celebrity.import_celebrities

# Suppose que vous avez déjà récupéré les données des célébrités et les URLs des images de l'API
celebrities_data = fetch_celebrities_data_from_api()

celebrities_data.each do |celebrity_data|
  # Créez une célébrité dans la base de données
  celebrity = Celebrity.create!(
    first_name: celebrity_data[:first_name],
    last_name: celebrity_data[:last_name],
    age: celebrity_data[:age],
    # Autres attributs de célébrité
  )

  # Téléchargez l'image depuis l'URL de l'API
  image_url = celebrity_data[:image_url]
  image = open(image_url)

  # Attachez l'image à la célébrité
  celebrity.photo.attach(io: image, filename: "#{celebrity.first_name}_#{celebrity.last_name}_photo.jpg")
end


# Supprimer les réservations associées aux célébrités
Celebrity.all.each do |celebrity|
  celebrity.bookings.destroy_all
end

# Ensuite, importer les célébrités
Celebrity.import_celebrities
