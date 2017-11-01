require "httparty"

class  ApiMuncherWrapper
  BASE_URL = "https://edamam.com/"

  def self.get_recipes(search_term)
    puts "Searching for recipes about #{search_term}."
    url = BASE_URL + "search?q=#{search_term}" + "&from=0" + "&to=5"
    data = HTTParty.get(url)
    # if data["hits"]
    #   return data["hits"]
    # else
    #   return []
    # end
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


private

def self.create_recipe(api_params)
  return Recipe.new(
    api_params["label"],
    api_params["source"],
    api_params["image"],
    {
      url: api_params["url"],
      shareAs: api_params["shareAs"],
      ingredientLines: api_params["ingredientLines"]
    }
  )
end #method

end #class


# For channels:
# parsed_response = {"channels => [id=>1, name=>value, etc. ]"}
#
# when you use the data[channel], it starts from id, i.e. from the array, because you've out channels into the data


# For recipes






#with the data: => [{"recipe"=>
#    {"uri"=>
#      "http://www.edamam.com/ontologies/edamam.owl#recipe_57d41c954296c7332ee57e3f6bc6f99a",
#     "label"=>"Baked Eggs",
#     "image"=>
#      "https://www.edamam.com/web-img/7c0/7c06d6352abacc41e169a954ebc3740e.jpg",
#     "source"=>"Leite's Culinaria",
#     "url"=>






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
