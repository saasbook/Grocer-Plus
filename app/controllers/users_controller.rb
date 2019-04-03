class UsersController < ApplicationController

	def show
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

	def update
		#save form data for user
		redirect_to show_path
	end
end
