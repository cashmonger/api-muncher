require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
  end


  def search
    @search_term = params[:search_term]

    @from = (params[:from]) ? params[:from].to_i : 0
    @previous = @from - 10
    @from = @from + 10
    #increase by 10
    @results = ApiMuncherWrapper.get_recipes(params[:search_term], @from).paginate(:page => params[:page], per_page: 10)

    if @results
      flash[:status] = :success
    else
      flash[:status] = :error
      flash[:message] = "Sorry, there are no results for that search"
      redirect_to root_path
    end

  end

  def show
    @result = ApiMuncherWrapper.show_recipe(params[:id])

    if @result
      flash[:status] = :success
    else
      flash[:status] = :error
      flash[:message] = "Recipe Not Found"
      redirect_to search_path
    end
  end

  # def next_page
  #   @results = ApiMuncherWrapper.get_recipes(params[:search_term, :first, :last])
  # end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:search_term, :uri, :short_uri, :id, :first, :last, :from)
  # end
  #
  # def set_page
  #   @page = params[:page] || 0
  # end
end
# @results = ApiMuncherWrapper.get_recipes(params[:search_term], @from)
#results is an array of recipe objects.
# .parsed_response["hits"].offset(@page * 10)

# if a params first is present, then set first equal to that, otherwise set it equal to 0
#if you've already set it, set it to what it was, if not, set it to 0

#   if params[:search]
#     @recipes = RecipeApiWrapper.search(params[:search], @from)
#   else
#     @recipes = nil
#   end
# end
# def self.search(food, from, app_id=APP_ID)
