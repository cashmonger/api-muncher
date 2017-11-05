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
      VCR.use_cassette("recipes")
      result = ApiMuncherWrapper.show_recipe("id")
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
