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

# Clear existing data
Property.destroy_all
Unit.destroy_all

# Create properties
property1 = Property.create!(
  address: "123 Maple St",
  city: "Springfield",
  state: "IL"
)

property2 = Property.create!(
  address: "456 Oak Ave",
  city: "Lincoln",
  state: "NE"
)

# Create units for property1
Unit.create!(
  property: property1,
  bedroom_count: 2,
  bathroom_count: 1,
  square_footage: 850,
  rent_price: 1200.00
)

Unit.create!(
  property: property1,
  bedroom_count: 3,
  bathroom_count: 2,
  square_footage: 1200,
  rent_price: 1500.00
)

# Create units for property2
Unit.create!(
  property: property2,
  bedroom_count: 1,
  bathroom_count: 1,
  square_footage: 600,
  rent_price: 900.00
)

Unit.create!(
  property: property2,
  bedroom_count: 2,
  bathroom_count: 2,
  square_footage: 1000,
  rent_price: 1300.00
)

puts "Seed data created successfully!"
