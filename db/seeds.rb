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
roles = ["Camp Director", "Station Leader", "Crew Leader"]
training = ["None", "1 Day", "3 Days"]

User.create!(
  email: "savi@me.com",
  password: "123456",
  first_name: "Savithri",
  last_name: "Wewala",
  location: "Japan, Tokyo",
  admin_status: true,
  description: "Hello, my name is Savithri",
  img_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664769848/vdngpd4bmtp7oioig3bo.jpg"
)

User.create!(
  email: "keita@me.com",
  password: "123456",
  first_name: "Keita",
  last_name: "Wilson",
  location: "Japan, Tokyo",
  admin_status: true,
  description: "Hi everyone I'm Keita.",
  img_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664721811/macovccaszdtnctrjxbt.jpg"
)

User.create!(
  email: "ayhem@me.com",
  password: "123456",
  first_name: "Ayhem",
  last_name: "Chelly",
  location: "Japan, Tokyo",
  admin_status: true,
  description: "Hi there! my name is Ayhem.",
  img_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667954065/heegtqhasvkercvbbzi4.jpg"
)

User.create!(
  email: "yulia@me.com",
  password: "123456",
  first_name: "Yulia",
  last_name: "Naumenko",
  location: "Japan, Tokyo",
  admin_status: true,
  description: "Hi, nice to see you here) My name is Yulia.",
  img_url: "https://avatars.githubusercontent.com/u/114731843?v=4"
)

10.times do User.create!(
  first_name: Faker::Name.unique.name.first_name,
  last_name: Faker::Name.unique.name.last_name,
  email: Faker::Internet.email,
  location: location.sample,
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  language: Faker::Nation.language,
  past_roles: roles.sample,
  admin_status: false,
  training: training.sample,
  certifications: Faker::Job.title,
  avatar_pic: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg").sample
)
end

puts "... created #{User.count} Users."
