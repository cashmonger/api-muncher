require "httparty"

class  ApiMuncherWrapper
  BASE_URL = "https://edamam.com/"

  def self.get_recipes(search_term)
    puts "Searching for recipes about #{search_term}."
    url = BASE_URL + "search?q=#{search_term}" + "&from=0" + "&to=5"
    data = HTTParty.get(url)
    if data["hits"]
      return data["hits"]
    else
      return []
    end
    # results = data.parsed_response
    #   return data
  end #method
end #class



# @results =["hits"] ApiMuncherWrapper.get_recipes(params[:search_term]).parsed_response["hits"].offset(@page * 10)
# url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
# end
#
# curl "https://api.edamam.com/""


#
# search?q=chicken&
# app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
# #&from=0
#&to=3
#&calories=gte%20591,%20lte%20722
#&health=alcohol-free"

# class  ApiMuncherWrapper
#   BASE_URL = "https://edamam.com/"
#
#   def self.get_recipes(search_term)
#     puts "Searching for recipes about #{search_term}."
#     url = BASE_URL + "search?q=#{search_term}" + "&from=0" + "&to=5"
#     data = HTTParty.get(url)
#     # results = data.parsed_response
#     return data
#   end
# end
#
# array
#
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
