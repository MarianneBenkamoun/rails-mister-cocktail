
ingredients = %w(eau vin sucre oeuf farine chocolat)

ingredients.each do |ingredient|
  Ingredient.create(name:ingredient)
end




7.times do
  cocktail = Cocktail.new(name: "Le "+Faker::StarWars.droid)
  cocktail.save!
  end



