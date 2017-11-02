class RecipesController < ApplicationController
  before_action :set_page, only: [:index]

  def index
    # @results = ApiMuncherWrapper.get_recipes(params[:search_term])
  end



  def search
    @search_term = params[:search_term]
    @from = (params[:from]) ? params[:from].to_i : 0
    # if a params first is present, then set first equal to that, otherwise set it equal to 0
    #if you've already set it, set it to what it was, if not, set it to 0
    @previous = @from - 10
    @from = @from + 10

    #increase by 10
    @results = ApiMuncherWrapper.get_recipes(params[:search_term], @from)
    # @results = ApiMuncherWrapper.get_recipes(params[:search_term], @from)
    #results is an array of recipe objects.
    # .parsed_response["hits"].offset(@page * 10)
  end

  def show
    @result = ApiMuncherWrapper.show_recipe(params[:id])
  end

  # def next_page
  #   @results = ApiMuncherWrapper.get_recipes(params[:search_term, :first, :last])
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:search_term, :uri, :short_uri, :id, :first, :last, :from)
  end

  def set_page
    @page = params[:page] || 0
  end
end

# def get_category
# @category = Category.find_by(id: params[:id])

# binding.pry
# @uri = result.uri

# @uri = params[:id]
# binding.pry
# @uri = params[:id]

#   if params[:search]
#     @recipes = RecipeApiWrapper.search(params[:search], @from)
#   else
#     @recipes = nil
#   end
# end
# def self.search(food, from, app_id=APP_ID)
#   url = BASE_URL + "?q=#{food}" + "&from=#{from}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
#   response = HTTParty.get(url)
#
#   check_status(response)
#
#   recipe_list = []
#   if response["hits"]
#     response["hits"].each do |raw_recipe|
#       recipe_list << self.create_recipe(raw_recipe["recipe"])
#     end
#   end
#
#   return recipe_list
# end
# RecipeApiWrapper.search(params[:search], @from)
