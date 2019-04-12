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
	    @calories = calc_calories(@gender, @weight, @height, @age, @exercise, @goal)
	end

	def calc_calories(gender, weight, height, age, exercise, goal)
		#These calculations require kg and cm.  Will need to add
		#units to the form in the future.
	    if gender == 'Male'
		    calories = 10*weight + 6.25*height - 5*age + 5
		else
			calories = 10*weight + 6.25*height - 5*age - 161
		end
		if exercise == 'Light'
			calories *= 1.375
		elsif exercise == 'Moderate'
			calories *= 1.55
		else
			calories *= 1.725
		end
		#If you are sedentary and do not exercise, multiply your 
		#BMR by 1.2. If you exercise lightly one to three times 
		#per week, multiply by 1.375. If you exercise three to 
		#five days per week, multiply by 1.55. For exercise six 
		#or seven days per week, multiply by 1.725; if you exercise 
		#seven days a week and also have a physically demanding job, 
		#multiply by 1.9.

		if goal == 'Gain'
			calories += 500
		elsif goal == 'Lose'
			calories -= 500
		end
		return calories
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
