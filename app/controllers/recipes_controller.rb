class RecipesController < ApplicationController
	def index
	  	# user will be able to see all recipes for them 
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

    # def edit
    # 	# user will be able to edit information they provided when signing up
    # 	# user will be able to submit information
    # 	# user will then be redirected to index page

    # end
end
