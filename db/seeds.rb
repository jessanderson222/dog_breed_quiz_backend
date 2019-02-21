# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

Dog.destroy_all

dogapi_url = 'https://dog.ceo/api/breeds/list/all'
response = RestClient.get(dogapi_url)
data = JSON.parse(response)
dogdata = data["message"]

dogdata.each do |key, value|
   dog = Dog.new
   dog.breed = [key, value]
#    dog.img_url = `https://dog.ceo/api/breed/`key`/images`
   dog.save
end 

puts "done!"