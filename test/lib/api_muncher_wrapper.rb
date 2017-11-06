require 'test_helper'

describe ApiMuncherWrapper do
  describe "get_recipes" do
    it "Can get a list of recipes" do
      VCR.use_cassette("recipes") do
        result = ApiMuncherWrapper.get_recipes("peach", 0)
        result.must_be_kind_of Array
        result.length.must_be :>, 0
        result.each do |recipe|
          recipe.must_be_kind_of Recipe
        end #each
      end #use cassette
    end #get list
  end #get recipies

  describe "show_recipe" do
    it "Will show an individual recipe" do
      VCR.use_cassette("individual_recipe") do
        result = ApiMuncherWrapper.show_recipe("recipe_id")
        result.must_be_kind_of Recipe
        result.length.must_be 1
      end
    end
  end

end #all tests

# describe "send_msg" do
#   it "Can send a message to a channel" do
#     VCR.use_cassette("channels") do
#       result = SlackApiWrapper.send_msg("test-api-channel", "test message")
#       result.must_equal true
#     end
#   end

Skip to content
This repository
Search
Pull requests
Issues
Marketplace
Explore
 @cashmonger
 Sign out
 Watch 0
  Star 0  Fork 146 biciclista22/api-muncher
forked from Ada-C8/api-muncher
 Code  Pull requests 0  Projects 0  Wiki  Insights
Branch: master Find file Copy pathapi-muncher/test/recipe_api_wrapper_test.rb
a00e5f6  2 days ago
@biciclista22 biciclista22 Added Css styling and have passing wrapper tests
1 contributor
RawBlameHistory
78 lines (60 sloc)  1.9 KB
require 'test_helper'

describe RecipeApiWrapper do

  describe "#search" do
    #success case
    it "Can acquire a list of recipes" do
      VCR.use_cassette("recipes") do
        food = "cheese"
        from = "10"
        result = RecipeApiWrapper.search(food, from)

        result.must_be_kind_of Array

        result.each do |recipe|
          recipe.must_be_kind_of Recipe
        end #result.each do

        result.length.must_be :>, 0
      end #VCR do
    end #it

    #error case
    it "Raises an error when two arguments are not passed" do
      VCR.use_cassette("recipes") do
        food = "chicken"
        from = '0'
        proc {
          RecipeApiWrapper.search(food)
        }.must_raise ArgumentError

        proc {
          RecipeApiWrapper.search(from)
        }.must_raise ArgumentError
      end
    end # it

    it "Raises an error when the app id is incorrect" do
      VCR.use_cassette("recipes") do
        food = "avocado"
        from = "0"
        app_id = "bogus"

        proc {
          RecipeApiWrapper.search(food, from, app_id)
        }.must_raise RecipeApiWrapper::ApiError
      end
    end # it


  end # describe search

  # describe "#find" do
  #
  #   #success
  #   it "can find and create an instance of a recipe" do #success -- it is able to find the recipe -- numst return instance of recipe
  #     VCR.use_cassette("wrapper_test") do
  #       id = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
  #       recipe = RecipeApiWrapper.find(id)
  #
  #       recipe.must_be_kind_of Recipe
  #     end
  #   end
  #
  #   #failure -- it is not able to find recipe (wrong id) -- must return nil
  #   it "Will raise an error when the id is not correct" do
  #     VCR.use_cassette("wrapper_test") do
  #       id = "bogus id"
  #       proc {
  #         RecipeApiWrapper.find(id)
  #       }.must_raise RecipeApiWrapper::ApiError
  #     end
  #   end
  #
  # end

end # describe recipeapiwrapper

#test error case
