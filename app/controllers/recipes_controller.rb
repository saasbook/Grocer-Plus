class RecipesController < ApplicationController
	def index
	  	# user will be able to see all recipes for them 
    end

    # def edit
    # 	# user will be able to edit information they provided when signing up
    # 	# user will be able to submit information
    # 	# user will then be redirected to index page

    # end
    def favorite_recipe
        
        redirect_to show_path
    end
end
