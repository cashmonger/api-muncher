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
    @results = ApiMuncherWrapper.get_recipes(params[:search_term], @from)

    # .paginate(:page => params[:page], per_page: 10)


    unless @results.count > 0

      flash[:status] = :failure
      flash[:result_text] = "Sorry, there are no results for that search"
      flash[:message] = "This is a message"
      redirect_to root_path
    end

  end


  def show
    @result = ApiMuncherWrapper.show_recipe(params[:id])

    unless @result
      redirect_to root_path
      flash[:status] = :error
      flash[:message] = "Recipe Not Found"
    end
  end

end
