class RecipesController < ApplicationController
	def index
	  	# user will be able to see all recipes for them 
	    # user can click on a button to go to the edit page
	    @age = :age
	    @gender = :gender
	    @weight = :weight
	    @height = :height
	    @exercise = :exercise
	    @goal = :goal
	    @budget = :budget
	    @time = :time
	    @cuisine = :cuisine
    end

    def signup
    	# user will be able to enter in preferences/restrictions/user info
    	# user will be able to submit information
    	# user will then be redirected to the index page
    	# authentication
    end	

    def edit
    	# user will be able to edit information they provided when signing up
    	# user will be able to submit information
    	# user will then be redirected to index page

    end
end
