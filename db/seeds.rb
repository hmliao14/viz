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

# last requested page numbers = [1,2]
response = HTTParty.get('https://authenticjobs.com/api/?api_key=6cf34b9cc6643879e6c569fa1e563917&method=aj.jobs.search&perpage=100&page=1&format=json')
hash_listings = response.parsed_response["listings"]["listing"]

hash_listings.each do |listing|

  if listing["company"]["location"].nil?
    @city_name = "No City Name Provided"
    @country_name = "No Country Name Provided"
  else
    if listing["company"]["location"]["city"].nil?
      @city_name = "No City Name Provided"
    else
      @city_name = listing["company"]["location"]["city"]
    end
    if listing["company"]["location"]["country"].nil?
      @country_name = "No Country Name Provided"
    else
      @country_name = listing["company"]["location"]["country"]
    end
  end
  job_listing = {
    title:  listing["title"],
    post_date: listing["post_date"],
    company_name: listing["company"]["name"],
    category: listing["category"]["name"],
    keywords: listing["keywords"],
    city: @city_name,
    country: @country_name,
  }
  JobListing.create(job_listing)

end










#
