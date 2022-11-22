# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying all users..."
User.destroy_all
puts "Destroying all Camps..."
Camp.destroy_all
puts "Destroying all Assignments..."
Assignment.destroy_all

location = ["Japan, Tokyo", "Chile, Santiago", "Costa, Rica", "Havana, Cuba", "Iraq Bagdad", "Canada Ottawa", "Ukraine, Kyiv", "Spain, Madrid", "Philippines, Manila", "Tunisia, Tunis"]
roles = ["Camp Director", "Station Leader", "Crew Leader"]
training = ["None", "1 Day", "3 Days"]

User.create!(
  email: "savi@me.com",
  password: "123456",
  first_name: "Savithri",
  last_name: "Wewala",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664769848/vdngpd4bmtp7oioig3bo.jpg"
)

User.create!(
  email: "keita@me.com",
  password: "123456",
  first_name: "Keita",
  last_name: "Wilson",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664721811/macovccaszdtnctrjxbt.jpg"
)

User.create!(
  email: "ayhem@me.com",
  password: "123456",
  first_name: "Ayhem",
  last_name: "Chelly",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667954065/heegtqhasvkercvbbzi4.jpg"
)

User.create!(
  email: "yulia@me.com",
  password: "123456",
  first_name: "Yulia",
  last_name: "Naumenko",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://avatars.githubusercontent.com/u/114731843?v=4"
)

10.times do User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  location: location.sample,
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  language: Faker::Nation.language,
  past_roles: roles.sample,
  admin_status: false,
  training: training.sample,
  certifications: Faker::Job.title,
  avatar_pic: URI.open("https://thispersondoesnotexist.com/image")
)
  user.photo.attach(io: file, filename: user.png, content_type: image/png)
end

puts "... created #{User.count} Users."
