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
			@preference_list = [@gender, @weight, @height, @age, @exercise, @goal]
			@calories = self.class.calc_calories(@preference_list).round(0)
			@all_recipes = Recipe.find_in_api(@calories, @time, @dietary_preferences)
			if @all_recipes.nil?
				flash[:alert] = "API limit reached, please try again in one minute!"
				redirect_to edit_path
				return
			end
			@daily_recipes = self.class.do_daily_recipes(@all_recipes)
			@day = "Monday"
			
			@breakHash = @daily_recipes[1][@day]
			@breakImg = @breakHash["image"]
			@breakTitle = @breakHash["title"]
			@breakCals = @breakHash["calories"]
			@breakTime = @breakHash["readyInMinutes"]
			@breakLink = @breakHash['links'][0]
			@break_instructions_link = @breakHash['links'][1]

			@lunchHash = @daily_recipes[2][@day]
			@lunchImg = @lunchHash["image"]
			@lunchTitle = @lunchHash["title"]
			@lunchCals = @lunchHash["calories"]
			@lunchTime = @lunchHash["readyInMinutes"]
			@lunchLink = @lunchHash['links'][0]
			@lunch_instructions_link = @lunchHash['links'][1]

			@dinHash = @daily_recipes[3][@day]
			@dinImg = @dinHash["image"]
			@dinTitle = @dinHash["title"]
			@dinCals = @dinHash["calories"]
			@dinTime = @dinHash["readyInMinutes"]
			@dinLink = @dinHash['links'][0]
			@din_instructions_link = @dinHash['links'][1]
			
			breakfast_recipe = self.class.convert_to_recipe(@breakHash, "Breakfast")
			lunch_recipe = self.class.convert_to_recipe(@lunchHash, "Lunch")
			dinner_recipe = self.class.convert_to_recipe(@dinHash, "Dinner")

			@breakHash["groceries"].each do |grocery|
				new_grocery = Grocery.create(:name => grocery["text"], :weight_in_grams => grocery["weight"].to_f.round(2))
				new_grocery.recipe = breakfast_recipe
				new_grocery.save!
			end

			@lunchHash["groceries"].each do |grocery|
				new_grocery = Grocery.create(:name => grocery["text"], :weight_in_grams => grocery["weight"].to_f.round(2))
				new_grocery.recipe = lunch_recipe
				new_grocery.save!
			end

			@dinHash["groceries"].each do |grocery|
				new_grocery = Grocery.create(:name => grocery["text"], :weight_in_grams => grocery["weight"].to_f.round(2))
				new_grocery.recipe = dinner_recipe
				new_grocery.save!
			end

			current_user.recipes << breakfast_recipe
			current_user.recipes << lunch_recipe
			current_user.recipes << dinner_recipe
			current_user.calories = @calories
			current_user.save!
		else
			@calories = current_user.calories
			breakfast_recipe = current_user.recipes.where(:type => "PlanRecipe")[0]
			lunch_recipe = current_user.recipes.where(:type => "PlanRecipe")[1]
			dinner_recipe = current_user.recipes.where(:type => "PlanRecipe")[2]

			@breakTitle = breakfast_recipe.title
			@breakCals = breakfast_recipe.calories
			@breakTime = breakfast_recipe.time
			@breakImg = breakfast_recipe.image
			@breakLink = breakfast_recipe.link
			@break_instructions_link = breakfast_recipe.instr_link

			@lunchTitle = lunch_recipe.title
			@lunchCals = lunch_recipe.calories
			@lunchTime = lunch_recipe.time
			@lunchImg = lunch_recipe.image
			@lunchLink = lunch_recipe.link
			@lunch_instructions_link = lunch_recipe.instr_link

			@dinTitle = dinner_recipe.title
			@dinCals = dinner_recipe.calories
			@dinTime = dinner_recipe.time
			@dinImg = dinner_recipe.image
			@dinLink = dinner_recipe.link
			@din_instructions_link = dinner_recipe.instr_link
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
		if preference_list[4] == 'Light'
			calories *= 1.375
		elsif preference_list[4] == 'Moderate'
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
		#https://www.livestrong.com/article/526442-the-activity-factor-for-calculating-calories-burned/
		if preference_list[5] == 'Gain'
			calories += 500
		elsif preference_list[5] == 'Lose'
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
		@breakfast = current_user.recipes.where(:type => "PlanRecipe", :meal_type => "Breakfast")
		@lunch = current_user.recipes.where(:type => "PlanRecipe", :meal_type => "Lunch")
		@dinner = current_user.recipes.where(:type => "PlanRecipe", :meal_type => "Dinner")
	end

	def favorited_recipes
		@breakfast = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Breakfast")
		@lunch = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Lunch")
		@dinner = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Dinner")
	end
end
