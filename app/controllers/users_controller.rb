class UsersController < ApplicationController

	before_action :require_login

	def require_login
		if current_user.nil?
			redirect_to new_user_session_path
			return
		end
	end

	def set_vars_from_curr_user
		@age = current_user.age
	    @gender = current_user.gender
	    @weight = current_user.weight
	    @height = current_user.height * 2.54
	    @exercise = current_user.exercise
	    @goal = current_user.goal
	    @time = current_user.time
		@dietary_preferences = current_user.dietary_preferences
	end
  
	def show
		set_vars_from_curr_user
		if current_user.recipes.where(:type => "PlanRecipe").blank?
			@calories = self.class.calc_calories([@gender, @weight, @height, @age, @exercise, @goal]).round(0)
			@all_recipes = Recipe.find_in_api(@calories, @time, @dietary_preferences)
			if @all_recipes.nil? || @all_recipes.has_key?("hits")
				flash[:alert] = set_alert
				redirect_to edit_path
				return
			end
			@daily_recipes = self.class.do_daily_recipes(@all_recipes)
			save_vars_recipes_groceries(@daily_recipes[1]["Monday"], "breakfast")
			save_vars_recipes_groceries(@daily_recipes[2]["Monday"], "lunch")
			save_vars_recipes_groceries(@daily_recipes[3]["Monday"], "dinner")
			save_current_user
		else
			@calories = current_user.calories
			set_vars_from_recipe(current_user.recipes.where(:type => "PlanRecipe")[0], "breakfast")
			set_vars_from_recipe(current_user.recipes.where(:type => "PlanRecipe")[1], "lunch")
			set_vars_from_recipe(current_user.recipes.where(:type => "PlanRecipe")[2], "dinner")
		end
	end

	def set_alert
		if @all_recipes.nil?
			return "API limit reached, please try again in one minute!"
		else
			return "We're sorry, the API did not return recipes for the data you specified"
		end
	end
  
	def save_current_user
		current_user.calories = @calories
		current_user.save!
	end

	def save_vars_recipes_groceries(hash, meal_type)
		if meal_type == "breakfast"
			set_vars_for_meal_plan(hash, "breakfast")
			breakfast_recipe = self.class.convert_to_recipe(hash, "Breakfast")
			save_groceries(hash, breakfast_recipe)
			current_user.recipes << breakfast_recipe
		elsif meal_type == "lunch"
			set_vars_for_meal_plan(hash, "lunch")
			lunch_recipe = self.class.convert_to_recipe(hash, "Lunch")
			save_groceries(hash, lunch_recipe)
			current_user.recipes << lunch_recipe
		elsif meal_type == "dinner"
			set_vars_for_meal_plan(hash, "dinner")
			dinner_recipe = self.class.convert_to_recipe(hash, "Dinner")
			save_groceries(hash, dinner_recipe)
			current_user.recipes << dinner_recipe
		end
	end

	def set_vars_for_meal_plan(hash, meal_type)
		if meal_type == "breakfast"
			@breakImg = hash["image"]
			@breakTitle = hash["title"]
			@breakCals = hash["calories"]
			@breakTime = hash["readyInMinutes"]
			@breakLink = hash['link']
		elsif meal_type == "lunch"
			@lunchImg = hash["image"]
			@lunchTitle = hash["title"]
			@lunchCals = hash["calories"]
			@lunchTime = hash["readyInMinutes"]
			@lunchLink = hash['link']
		elsif meal_type == "dinner"
			@dinImg = hash["image"]
			@dinTitle = hash["title"]
			@dinCals = hash["calories"]
			@dinTime = hash["readyInMinutes"]
			@dinLink = hash['link']
		end
	end

	def save_groceries(hash, recipe)
		hash["groceries"].each do |grocery|
			new_grocery = Grocery.create(:name => grocery["text"], :weight_in_grams => grocery["weight"].to_f.round(2))
			new_grocery.recipe = recipe
			new_grocery.save!
		end
	end

	def set_vars_from_recipe(recipe, meal_type)
		if meal_type == "breakfast"
			@breakTitle = recipe.title
			@breakCals = recipe.calories
			@breakTime = recipe.time
			@breakImg = recipe.image
			@breakLink = recipe.link
		elsif meal_type == "lunch"
			@lunchTitle = recipe.title
			@lunchCals = recipe.calories
			@lunchTime = recipe.time
			@lunchImg = recipe.image
			@lunchLink = recipe.link
		elsif meal_type == "dinner"
			@dinTitle = recipe.title
			@dinCals = recipe.calories
			@dinTime = recipe.time
			@dinImg = recipe.image
			@dinLink = recipe.link
		end
	end

	def self.convert_to_recipe(hash, meal_type)
		new_recipe = Recipe.new
		new_recipe.title = hash["title"]
		new_recipe.type = "PlanRecipe"
		new_recipe.meal_type = meal_type
		new_recipe.calories = hash["calories"]
		new_recipe.time = hash["readyInMinutes"]
		new_recipe.image = hash["image"]
		new_recipe.link = hash["links"][0]
		new_recipe.instr_link = hash["links"][1]
		return new_recipe
	end

	def self.do_daily_recipes(all_recipes)
		daily_recipes = Hash.new()
		days = {1 => "Monday", 2 => "Tuesday", 3 => "Wednesday",
			4 => "Thursday", 5 => "Friday", 6 => "Saturday", 7 => "Sunday"}

		all_recipes['items'].each do |recipe|
			if !daily_recipes.key?(recipe['slot'])
				daily_recipes[recipe['slot']] = Hash.new
			end
			if !daily_recipes[recipe['slot']].key?(days[recipe['day']])
				daily_recipes[recipe['slot']][days[recipe['day']]] = Hash.new
				daily_recipes[recipe['slot']][days[recipe['day']]] = recipe
			end
		end
		return daily_recipes
	end

	def self.calc_calories(preference_list)
		#Formula found here:
		#https://www.calculator.net/calorie-calculator.html
		preference_list[1] = preference_list[1] * 0.453592
	    if preference_list[0] == 'Male'
		    calories = 10*preference_list[1] + 6.25*preference_list[2] - 5*preference_list[3] + 5
		else
			calories = 10*preference_list[1] + 6.25*preference_list[2] - 5*preference_list[3] - 161
		end
		
		calories = UsersController.exercise_level(calories, preference_list[4])

		#If you are sedentary and do not exercise, multiply your 
		#BMR by 1.2. If you exercise lightly one to three times 
		#per week, multiply by 1.375. If you exercise three to 
		#five days per week, multiply by 1.55. For exercise six 
		#or seven days per week, multiply by 1.725; if you exercise 
		#seven days a week and also have a physically demanding job, 
		#multiply by 1.9.
		#https://www.livestrong.com/article/526442-the-activity-factor-for-calculating-calories-burned/
		calories = UsersController.goal(calories, preference_list[5])
		return calories
	end

	def self.exercise_level(calories, level)
		if level == 'Light'
			calories *= 1.375
		elsif level == 'Moderate'
			calories *= 1.55
		else
			calories *= 1.725
		end
		return calories
	end

	def self.goal(calories, target_goal)
		if target_goal == 'Gain'
			calories += 500
		elsif target_goal == 'Lose'
			calories -= 500
		end
		return calories
	end

	def update
		current_user.age = params[:age].to_i
		current_user.weight = params[:weight].to_i
		current_user.height = params[:height].to_i
		current_user.time = params[:time].to_i
		current_user.gender = params[:gender]
		current_user.exercise = params[:exercise]
		current_user.goal = params[:goal]
		current_user.dietary_preferences = ''
		if params.key?("dietary_preferences") 
			params["dietary_preferences"].each do |elem|
				current_user.dietary_preferences += '&health=' + elem
			end
		else
			current_user.dietary_preferences = ''
		end
		current_user.save!
		if params.key?(:api)
			current_user.recipes.where(:type => "PlanRecipe").delete_all
		end
		redirect_to show_path
	end

	def favorite_recipe
		previously_favorited = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => params[:Type], :title => params[:Title], 
		:calories => params[:Calories], :time => params[:PrepTime])
		if previously_favorited.blank?
			current_user.recipes.create(:type => "FavoritedRecipe", :meal_type => params[:Type], :title => params[:Title], 
				:calories => params[:Calories], :time => params[:PrepTime], :instr_link => params[:Instr_link]
				)
			current_user.save!
		end
		redirect_to favorited_recipes_path
	end

	def grocery_list
		set_recipes("PlanRecipe")
	end

	def favorited_recipes
		set_recipes("FavoritedRecipe")
	end

	def set_recipes(type)
		@breakfast = current_user.recipes.where(:type => type, :meal_type => "Breakfast")
		@lunch = current_user.recipes.where(:type => type, :meal_type => "Lunch")
		@dinner = current_user.recipes.where(:type => type, :meal_type => "Dinner")
	end
end
