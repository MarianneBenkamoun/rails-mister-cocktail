Ingredient.destroy_all
ingredients = %w(eau citron framboise vodka tequila sucre rhum)

ingredients.each do |ingredient|
  Ingredient.create(name:ingredient)
end

