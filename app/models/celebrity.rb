class Celebrity < ApplicationRecord

  has_many :bookings, dependent: :destroy

require_relative '../config/environment'

  API_KEY = 'tY8DbbwHy+hY3kfrM4i2fg==AH2KnOweoY3qRx6O'
  NAMES = [
    "Brad Pitt", "Scarlett Johansson", "Leonardo DiCaprio",
    "Morgan Freeman", "Beyonce", "Jay-Z", "Emmanuel Macron", "Jean-Luc Mélenchon",
    "Serena Williams", "LeBron James", "Teddy Riner", "Lionel Messi"
  ]

  def self.import_celebrities
    puts "Cleaning up database..."
    Celebrity.destroy_all
    puts "Database cleaned"

    created_count = 0

    NAMES.each do |name|
      break if created_count >= 10

      puts "Importing celebrity data for #{name}"
      url = "https://api.api-ninjas.com/v1/celebrity?name=#{CGI.escape(name)}"
      response = URI.open(url, "X-Api-Key" => API_KEY).read
      celebrity_data = JSON.parse(response).first

      if celebrity_data
        puts "Creating #{celebrity_data['name']}"
        Celebrity.create(
          name: celebrity_data["name"],
          bio: celebrity_data["bio"],
          profile_url: celebrity_data["image"]
        )
        created_count += 1
      else
        puts "No data found for #{name}"
      end
    end

    puts "Celebrities created: #{created_count}"
  end
end
