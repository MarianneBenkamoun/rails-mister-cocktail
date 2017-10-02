
1.times do
  cocktail = Cocktail.new(name: "Le "+Faker::BossaNova.artist)
  cocktail.save!
  ingredient = Ingredient.new(name:Faker::Food.ingredient)
  ingredient.save!
    1.times do
      dose = Dose.new(description: "ajoutez 10cl de #{ingredient}" , cocktail:cocktail, ingredient:ingredient )
      dose.save!
    end
  end


