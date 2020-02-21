# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'faker'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_url = URI.parse(url).read

ingredients = JSON.parse(serialized_url)

puts 'Destroying cocktails...'

Cocktail.destroy_all
Ingredient.destroy_all

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts "Created #{Ingredient.count} ingredients!"
puts '.....'

puts 'Creating sample cocktails...'
10.times do
  # url = open('https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg?cs=srgb&dl=alcoholic-bar-beverage-blur-338713.jpg&fm=jpg').read
  Cocktail.create!(
    name: Faker::Kpop.iii_groups
    # image_url: url
  )
end

puts "#{Cocktail.count} cocktails created"

# puts 'preparing doses...'
# Cocktail.all.each do |cocktail|
#   5.times do
#     Dose.create(ingredient: Ingredient.all.sample, cocktail: cocktail, description: "#{(1..10).to_a.sample} ounce(s)")
#   end
# end

# puts 'Finished'
