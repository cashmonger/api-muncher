require "httparty"
# , first: 0, last:  10

class  ApiMuncherWrapper
  BASE_URL = "https://edamam.com/"

  def self.get_recipes(search_term, from)
    puts "Searching for recipes about #{search_term}."
    # url = BASE_URL + "search?q=#{search_term}" + "&from=0"
    # url = BASE_URL + "search?q=#{search_term}" + "&from=0" + "&to=5"
    url = BASE_URL + "search?q=#{search_term}" + "&from=#{from}"
    data = HTTParty.get(url)

    recipe_list = []
    if data["hits"]
      data["hits"].each do |hit|
        recipe_list << create_recipe(hit["recipe"])
        #making an array of channel data that will go to the create channel method
      end #
    end

    # return recipe_list
    return recipe_list
  end #method

  def self.show_recipe(id)
    puts "Searching for specific recipe"
    # puts URI.encode(uri)
    puts "#{id}"

    search_uri = "http://www.edamam.com/ontologies/edamam.owl" + "\#" + "#{id}"

    url = BASE_URL + "search?r=#{URI.encode(search_uri)}"
    # url = BASE_URL + "search?r=#{uri}"
    # data = HTTParty.get(url).parsed_response
    data = HTTParty.get(url)
    result = create_recipe(data[0])
    # create_recipe(hit["recipe"])

    return result
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["uri"],
      api_params["label"],
      api_params["source"],
      api_params["image"],

      {
        # uri: api_params["uri"],
        url: api_params["url"],
        shareAs: api_params["shareAs"],
        ingredientLines: api_params["ingredientLines"],
        yield: api_params["yield"],
        calories: api_params["calories"],
        dietLabels: api_params["dietLabels"],
        healthLabels: api_params["healthLabels"]
      }
    )
  end #method

end #class
#
#
# @calories = options[:calories]
# @dietLabels = options[:dietLabels]
# @healthLabels = options[:healthLabels]
# binding.pry
# url = BASE_URL + "search?r=#{search_uri}"
# For channels:
# parsed_response = {"channels => [id=>1, name=>value, etc. ]"}
#
# when you use the data[channel], it starts from id, i.e. from the array, because you've out channels into the data
# "https://edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a"
# "https://edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a"
# For recipes
#
#
# https://api.edamam.com/search/q=
# https://api.edamam.com/search/r=http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a
#
#

#with the data: => [{"recipe"=>
#    {"uri"=>
#      "http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a",
#     "label"=>"Baked Eggs",
#     "image"=>
#      "https://www.edamam.com/web-img/7c0/7c06d6352abacc41e169a954ebc3740e.jpg",
#     "source"=>"Leite's Culinaria",
#     "url"=>
# if data["hits"]
#   return data["hits"]
# else
#   return []
# end
# if data["hits"]
#   return data["hits"]
# else
#   return []
# end




# @results =["hits"] ApiMuncherWrapper.get_recipes(params[:search_term]).parsed_response["hits"].offset(@page * 10)
# url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
# end
#
# curl "https://api.edamam.com/""
# results = data.parsed_response
#   return data

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


# [{"uri"=>"http://www.edamam.com/ontologies/edamam.owl#recipe_9b3071c14bd6df72d94bc4efd9258fdb",
#   "label"=>"Eggs Benedict",
#   "image"=>"https://www.edamam.com/web-img/48a/48ae883aa945c01b0b8c590d40e6fd34.jpg",
#   "source"=>"BBC",
#   "url"=>"http://www.bbc.co.uk/food/recipes/eggsbenedict_9435",
#   "shareAs"=>"http://www.edamam.com/recipe/eggs-benedict-9b3071c14bd6df72d94bc4efd9258fdb/-",
#   "yield"=>4.0,
#   "dietLabels"=>["Low-Carb"],
#   "healthLabels"=>
#    ["Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"],
#   "cautions"=>[],
#   "ingredientLines"=>
#    ["6 tbsp hollandaise sauce", "A little butter"],
#
#   "calories"=>3016.378716430664,
#   "totalNutrients"=> {}
#
#  "weight"=>113.0}],

#  "calories"=>3016.378716430664,
#  "totalWeight"=>954.0815505981445,
#  "totalNutrients"=>
#   {"ENERC_KCAL"=>
#     {"label"=>"Energy", "quantity"=>3016.378716430664, "unit"=>"kcal"},
#    "FAT"=>{"label"=>"Fat", "quantity"=>254.9161876953125, "unit"=>"g"},
#    "FASAT"=>
#     {"label"=>"Saturated", "quantity"=>112.49355480957031, "unit"=>"g"},
#    "FATRN"=>
#     {"label"=>"Trans", "quantity"=>4.323619919586181, "unit"=>"g"},
#    "FAMS"=>
#     {"label"=>"Monounsaturated", "quantity"=>92.76430497192382, "unit"=>"g"},
#    "FAPU"=>
#     {"label"=>"Polyunsaturated", "quantity"=>31.565761336669922, "unit"=>"g"},
#    "CHOCDF"=>
#     {"label"=>"Carbs", "quantity"=>89.14136054458618, "unit"=>"g"},
#    "FIBTG"=>
#     {"label"=>"Fiber", "quantity"=>7.942081550598144, "unit"=>"g"},
#    "SUGAR"=>
#     {"label"=>"Sugars", "quantity"=>11.074714026641846, "unit"=>"g"},
#    "PROCNT"=>
#     {"label"=>"Protein", "quantity"=>93.65072124862671, "unit"=>"g"},
#    "CHOLE"=>
#     {"label"=>"Cholesterol", "quantity"=>1430.5565240478516, "unit"=>"mg"},
#    "NA"=>
#     {"label"=>"Sodium", "quantity"=>3346.7300531005853, "unit"=>"mg"},
#    "CA"=>
#     {"label"=>"Calcium", "quantity"=>592.4468312835694, "unit"=>"mg"},
#    "MG"=>
#     {"label"=>"Magnesium", "quantity"=>145.93978607177735, "unit"=>"mg"},
#    "K"=>
#     {"label"=>"Potassium", "quantity"=>1493.5561894989012, "unit"=>"mg"},
#    "FE"=>{"label"=>"Iron", "quantity"=>10.99027941131592, "unit"=>"mg"},
#    "ZN"=>{"label"=>"Zinc", "quantity"=>9.581983287811278, "unit"=>"mg"},
#    "P"=>
#     {"label"=>"Phosphorus", "quantity"=>1288.459705657959, "unit"=>"mg"},
#    "VITA_RAE"=>
#     {"label"=>"Vitamin A", "quantity"=>1286.5885025024413, "unit"=>"µg"},
#    "THIA"=>
#     {"label"=>"Thiamin (B1)", "quantity"=>1.8249554544067381, "unit"=>"mg"},
#    "RIBF"=>
#     {"label"=>"Riboflavin (B2)", "quantity"=>2.1472096252441406, "unit"=>"mg"},
#    "NIA"=>
#     {"label"=>"Niacin (B3)", "quantity"=>19.736340146408082, "unit"=>"mg"},
#    "VITB6A"=>
#     {"label"=>"Vitamin B6", "quantity"=>1.5126701737213135, "unit"=>"mg"},
#    "FOLDFE"=>
#     {"label"=>"Folate equivalent (total)",
#      "quantity"=>273.0506015777588,
#      "unit"=>"µg"},
#    "FOLFD"=>
#     {"label"=>"Folate (food)", "quantity"=>195.14407752990724, "unit"=>"µg"},
#    "FOLAC"=>
#     {"label"=>"Folic acid", "quantity"=>45.793262023925784, "unit"=>"µg"},
#    "VITB12"=>
#     {"label"=>"Vitamin B12", "quantity"=>4.586748528289795, "unit"=>"µg"},
#    "VITD"=>{"label"=>"Vitamin D", "quantity"=>333.12, "unit"=>"IU"},
#    "TOCPHA"=>
#     {"label"=>"Vitamin E", "quantity"=>7.605765240478515, "unit"=>"mg"},
#    "VITK1"=>
#     {"label"=>"Vitamin K", "quantity"=>10.204163101196288, "unit"=>"µg"}},
#  "totalDaily"=>
#   {"ENERC_KCAL"=>
#     {"label"=>"Energy", "quantity"=>150.81893582153322, "unit"=>"%"},
#    "FAT"=>{"label"=>"Fat", "quantity"=>392.1787503004807, "unit"=>"%"},
#    "FASAT"=>
#     {"label"=>"Saturated", "quantity"=>562.4677740478515, "unit"=>"%"},
#    "CHOCDF"=>
#     {"label"=>"Carbs", "quantity"=>29.71378684819539, "unit"=>"%"},
#    "FIBTG"=>
#     {"label"=>"Fiber", "quantity"=>31.768326202392576, "unit"=>"%"},
#    "PROCNT"=>
#     {"label"=>"Protein", "quantity"=>187.30144249725342, "unit"=>"%"},
#    "CHOLE"=>
#     {"label"=>"Cholesterol", "quantity"=>476.8521746826172, "unit"=>"%"},
#    "NA"=>{"label"=>"Sodium", "quantity"=>139.44708554585773, "unit"=>"%"},
#    "CA"=>{"label"=>"Calcium", "quantity"=>59.24468312835694, "unit"=>"%"},
#    "MG"=>
#     {"label"=>"Magnesium", "quantity"=>36.48494651794434, "unit"=>"%"},
#    "K"=>
#     {"label"=>"Potassium", "quantity"=>42.673033985682885, "unit"=>"%"},
#    "FE"=>{"label"=>"Iron", "quantity"=>61.057107840643994, "unit"=>"%"},
#    "ZN"=>{"label"=>"Zinc", "quantity"=>63.879888585408516, "unit"=>"%"},
#    "P"=>
#     {"label"=>"Phosphorus", "quantity"=>184.06567223685127, "unit"=>"%"},
#    "VITA_RAE"=>
#     {"label"=>"Vitamin A", "quantity"=>142.95427805582682, "unit"=>"%"},
#    "THIA"=>
#     {"label"=>"Thiamin (B1)", "quantity"=>121.66369696044922, "unit"=>"%"},
#    "RIBF"=>
#     {"label"=>"Riboflavin (B2)", "quantity"=>126.30644854377299, "unit"=>"%"},
#    "NIA"=>
#     {"label"=>"Niacin (B3)", "quantity"=>98.68170073204041, "unit"=>"%"},
#    "VITB6A"=>
#     {"label"=>"Vitamin B6", "quantity"=>75.63350868606568, "unit"=>"%"},
#    "FOLDFE"=>
#     {"label"=>"Folate equivalent (total)",
#      "quantity"=>68.2626503944397,
#      "unit"=>"%"},
#    "VITB12"=>
#     {"label"=>"Vitamin B12", "quantity"=>76.44580880482992, "unit"=>"%"},
#    "VITD"=>{"label"=>"Vitamin D", "quantity"=>83.28, "unit"=>"%"},
#    "TOCPHA"=>
#     {"label"=>"Vitamin E", "quantity"=>38.02882620239258, "unit"=>"%"},
#    "VITK1"=>
#     {"label"=>"Vitamin K", "quantity"=>12.755203876495361, "unit"=>"%"}},
#  "digest"=>
