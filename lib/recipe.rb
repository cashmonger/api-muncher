class Recipe
  attr_reader :label, :source, :image

  def initialize(label, source, image, options = {} )
    # raise ArgumentError if label == nil || name == "" || id == nil || id == ""

    @label = label
    @source = source
    @image = image


    @url = options[:url]
    @shareAs = options[:shareAs]
    @ingredientLines = options[:ingredientLines]
  end
end

# ingredientLines

# => [{"recipe"=>
#    {"uri"=>
#      "http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a",
#     "label"=>"Baked Eggs",
#     "image"=>
#      "https://www.edamam.com/web-img/7c0/7c06d6352abacc41e169a954ebc3740e.jpg",
#     "source"=>"Leite's Culinaria",
#     "url"=>
#      "http://leitesculinaria.com/96610/recipes-baked-eggs.html",
#     "shareAs"=>
#      "http://www.edamam.com/recipe/baked-eggs-57d41c954296c7332ee57e3f6bc6f99a/eggs",
#     "yield"=>6.0,
#     "dietLabels"=>
#      ["Low-Carb", "Low-Sodium"],
#     "healthLabels"=>
#      ["Peanut-Free",
#       "Tree-Nut-Free",
#       "Soy-Free",
#       "Fish-Free",
#       "Shellfish-Free"],
#     "cautions"=>[],
#     "ingredientLines"=>
#      ["Vegetable oil or butter, for the muffin tin",
#       "6 large eggs (choose eggs of a very similar size)",
#       "2 tablespoons chopped, slightly undercooked bacon (figure 2 slices)",
