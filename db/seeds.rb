# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Graph.destroy_all
JobListing.destroy_all
JobCategory.destroy_all

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
response = HTTParty.get('https://authenticjobs.com/api/?api_key=6cf34b9cc6643879e6c569fa1e563917&method=aj.jobs.search&perpage=100&page=2&format=json')
hash_listings = hash_listings + response.parsed_response["listings"]["listing"]

hash_listings.each do |listing|

  if listing["company"]["location"].nil?
    @city_name = "City N/A"
    @country_name = "Country N/A"
  else
    if listing["company"]["location"]["city"].nil?
      if listing["company"]["location"].nil?
        @city_name = "City N/A"
      else
        @city_name = listing["company"]["location"]["name"]
      end
    else
      @city_name = listing["company"]["location"]["city"]
    end

    if listing["company"]["location"]["country"].nil?
      if listing["company"]["location"].nil?
        @country_name = "Country N/A"
      else
        @country_name = listing["company"]["location"]["name"]
      end
    else
      @country_name = listing["company"]["location"]["country"]
    end
  end
  job_listing = {
    title:  listing["title"],
    post_date: listing["post_date"],
    company_name: listing["company"]["name"],
    category: listing["category"]["name"].gsub(' &amp;', " and"),
    keywords: listing["keywords"],
    city: @city_name,
    country: @country_name,
  }
  JobListing.create(job_listing)

end

# make new category into the model

response = HTTParty.get('https://authenticjobs.com/api/?api_key=6cf34b9cc6643879e6c569fa1e563917&method=aj.categories.getList&perpage=100&format=json')
arr_categories = response.parsed_response["categories"]["category"]
arr_categories.each do |category|
  JobCategory.create(name: category["name"].gsub(' &amp;', " &"))
end
JobCategory.create(name: "All Categories")



#
