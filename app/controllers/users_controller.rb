class UsersController < ApplicationController

	#def user_params
	#	params.permit(:age, :weight, :height, :exercise, :goal, :budget, :time, :cuisine, :gender)
	#end

	def show
		@age = current_user.age
	    @gender = :gender
	    @weight = :weight
	    @height = :height
	    @exercise = :exercise
	    @goal = :goal
	    @budget = :budget
	    @time = :time
	    @cuisine = :cuisine
	    @calories = 1 
	end

	def update
		#save form data for user
		current_user.age = params[:age]["age"].to_i
		current_user.weight = params[:weight]["weight"].to_i
		current_user.height = params[:height]["height"].to_i
		current_user.budget = params[:budget]["budget"].to_i
		current_user.time = params[:time]["time"].to_i
		current_user.gender = params[:gender]
		current_user.exercise = params[:exercise]
		current_user.cuisine = params[:cuisine]["cuisine"]
		current_user.save!
		redirect_to show_path
	end
end
