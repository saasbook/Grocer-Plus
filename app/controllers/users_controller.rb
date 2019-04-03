class UsersController < ApplicationController

	#def user_params
	#	params.permit(:age, :weight, :height, :exercise, :goal, :budget, :time, :cuisine, :gender)
	#end

	def show
		@age = current_user.age
	    @gender = current_user.gender
	    @weight = current_user.weight
	    @height = current_user.height
	    @exercise = current_user.exercise
	    @goal = current_user.goal
	    @budget = current_user.budget
	    @time = current_user.time
	    @cuisine = current_user.cuisine
	    if @gender == 'Male'
		    @calories = 10*@weight + 6.25*@height - 5*@age + 5
		else
			@calories = 10*@weight + 6.25*@height - 5*@age - 161
		end
		#These calculations require kg and cm.  Will need to add
		#units to the form in the future.
	end

	def update
		#save form data for user
		current_user.age = params[:age].to_i
		current_user.weight = params[:weight].to_i
		current_user.height = params[:height].to_i
		current_user.budget = params[:budget].to_i
		current_user.time = params[:time].to_i
		current_user.gender = params[:gender]
		current_user.exercise = params[:exercise]
		current_user.cuisine = params[:cuisine]["cuisine"]
		current_user.save!
		redirect_to show_path
	end
end
