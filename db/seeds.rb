# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
20.times do
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    headline: Faker::Lorem.unique.sentence(word_count: 6),
    address_1: Faker::Address.street_name,
    address_2: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount((50..100).to_a.sample, "USD")
  })
  property1 = "property-#{rand(1..3)}.png"
  property2 = "property-#{rand(3..5)}.png"
  file_path1 = Rails.root.join("db/images/#{property1}")
  file_path2 = Rails.root.join("db/images/#{property2}")
  property.images.attach(io: File.open(file_path1), filename: property1, content_type: "image/png")
  property.images.attach(io: File.open(file_path2), filename: property2, content_type: "image/png")
end
