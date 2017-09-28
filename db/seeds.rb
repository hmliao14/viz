# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

users = [{
  first_name: "Chanel",
  last_name: "Sparks",
  city: "San Francisco",
  image: "http://www.boostinspiration.com/wp-content/uploads/2010/09/BlackAndWhitePhotographyPeople1.jpg",
  email: "csparks@unknown.com",
  password: "ipizza",
  },{
    first_name: "janet",
    last_name: "Sparks",
    city: "San Francisco",
    image: "http://www.curiositytravels.org/wp-content/uploads/2015/12/IMG_6425.jpg",
    email: "jsparks@unknown.com",
    password: "ipizza",
    },
]

  User.create(users)
