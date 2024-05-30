require 'cloudinary'

# Seed celebrities
10.times do
  celebrity = Celebrity.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(from: 18, to: 80),
    address: Faker::Address.full_address,
    price: Faker::Number.between(from: 1000, to: 10000)
    # Ajoutez d'autres attributs si nécessaire
  )

  # Téléchargez et stockez une photo aléatoire pour la célébrité
  photo_path = Faker::Avatar.image(slug: celebrity.first_name.downcase, size: '300x300', format: 'jpg')
  uploaded_photo = Cloudinary::Uploader.upload(photo_path)

  # Stockez l'URL de la photo dans la base de données
  celebrity.image_url = uploaded_photo['secure_url']

  # Sauvegardez la célébrité
  celebrity.save
end

