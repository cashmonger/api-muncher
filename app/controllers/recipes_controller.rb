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
    binding.pry
    @results = ApiMuncherWrapper.get_recipes(params[:search_term])[index]
    def get_category
  @category = Category.find_by(id: params[:id])
end

def category_params
  return params.require(:category).permit(:category_name)
end


  end

  def new
  end

  def create
  end
  # def find_book_by_params_id
  #   @book = Book.find_by(id: params[:id])
  #   unless @book
  #     head :not_found
  #   end

private

def recipe_params
  params.require(:recipe).permit(:search_term)
end

def set_page
  @page = params[:page] || 0
end
end
