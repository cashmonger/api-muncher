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
    @result = ApiMuncherWrapper.show_recipe(params[:id])
  end

  def next_page
    @results = ApiMuncherWrapper.get_recipes(params[:search_term, :first, :last])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:search_term, :uri, :short_uri, :id, :first, :last)
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
