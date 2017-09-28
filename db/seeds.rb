# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{
  first_name: "Chanel",
  last_name: "Sparks",
  current_city: "San Francisco",
  image: "http://www.boostinspiration.com/wp-content/uploads/2010/09/BlackAndWhitePhotographyPeople1.jpg",
  email: "csparks@unknown.com",
  password_digest: "pizza",
  }, {
    first_name: "Janet",
    last_name: "Sparks",
    current_city: "San Francisco",
    image: "https://i.pinimg.com/736x/8d/59/81/8d5981a2dbb27316afe9000066e8dbb2--yale-sands.jpg",
    email: "jsparks@unknown.com",
    password_digest: "pizza",
    }]

  User.create(users)
