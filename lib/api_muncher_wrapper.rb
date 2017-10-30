require "httparty"

class  ApiMuncherWrapper
  BASE_URL = "https://edamam.com/"

  def self.get_recipes(search_term)
    puts "Searching for recipes about #{search_term}."

    url = BASE_URL + "search?q=#{search_term}"

    data = HTTParty.get(url)

    puts data
  end
end

    # url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
# end
#
# curl "https://api.edamam.com/""


#
# search?q=chicken&
# app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
# #&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
