class RecipesController < ApplicationController


  def index

  end


  def search
    @results = ApiMuncherWrapper.get_recipes(params[:search_term])
  end

  def new
  end

  def create
  end

end

private

def recipe_params
  params.require(:recipe).permit(:search_term)
end

# def index
#   @channels = SlackApiWrapper.list_channels
# end
#
# def new
#   @channel = params[:channel]
# end
#
# def create
#   response = SlackApiWrapper.send_msg(params[:channel], params[:message])
#
#   if response
#     flash[:status] = "success"
#     flash[:message] = "Message Posted Successfully"
#   else
#     flash[:status] = "error"
#     flash[:message] = "Error Sending Message"
#   end
#
#   redirect_to root_path
# end
# end
