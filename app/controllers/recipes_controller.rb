class RecipesController < ApplicationController
  before_action :set_page, only: [:index]

  def index
    # @results = ApiMuncherWrapper.get_recipes(params[:search_term])
  end


  def search
    @results = ApiMuncherWrapper.get_recipes(params[:search_term])
    #results is an array of recipe objects.
    # .parsed_response["hits"].offset(@page * 10)
  end

  def show
    @result = ApiMuncherWrapper.show_recipe(params[:uri])
    # def get_category
    # @category = Category.find_by(id: params[:id])
  end


  private

  def recipe_params
    params.require(:recipe).permit(:search_term)
  end

  def set_page
    @page = params[:page] || 0
  end
end
