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
	    if @gender == 'Male'
		    @targetCals = 10*@weight + 6.25*@height - 5*@age + 5
		else
			@targetCals = 10*@weight + 6.25*@height - 5*@age - 161
		end
    end

    # def edit
    # 	# user will be able to edit information they provided when signing up
    # 	# user will be able to submit information
    # 	# user will then be redirected to index page

    # end
end
