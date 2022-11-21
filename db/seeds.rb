# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying all users..."
User.destroy_all
puts "Destroying all Camps..."
Camp.destroy_all
puts "Destroying all Assignments..."
Assignmet.destroy_all

location = ["Japan, Tokyo", "Chile, Santiago", "Costa, Rica", "Havana, Cuba", "Iraq Bagdad", "Canada Ottawa", "Ukraine, Kyiv", "Spain, Madrid", "Philippines, Manila", "Tunisia, Tunis"]

10.times do User.create!(
  first_name: Faker::Name.unique.name.first,
  last_name: Faker::Name.unique.name.last,
  email: Faker::Internet.email
)
end
