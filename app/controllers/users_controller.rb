class UsersController < ApplicationController

	#def user_params
	#	params.permit(:age, :weight, :height, :exercise, :goal, :budget, :time, :cuisine, :gender)
	#end

	def show
		@age = current_user.age
	    @gender = current_user.gender
	    @weight = current_user.weight
	    @height = current_user.height * 2.54
	    @exercise = current_user.exercise
	    @goal = current_user.goal
	    @budget = current_user.budget
	    @time = current_user.time
	    @cuisine = current_user.cuisine
		@calories = self.class.calc_calories(@gender, @weight, @height, @age, @exercise, @goal).round(0)

		@all_recipes = {'items' => 
				[
				{'day' => 1,
			 	'slot' => 1,
			 	'id' => 123456,
			 	'title' => "Eggs Benedict",
			 	'calories' => 200,
			 	'readyInMinutes' => 45,
				 'price' => 2
				 },	
				{'day' => 1,
			 	'slot' => 2,
			 	'id' => 123456,
			 	'title' => "Sweet & Sour Soup",
			 	'calories' => 340,
			 	'readyInMinutes' => 50,
				'price' => 3
				},	
				 {'day'=> 1,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Mushroom Risotto",
				 'calories' => 200,
				 'readyInMinutes' => 75,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "waffles",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "salad",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "burrito",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "grapes",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8
				 },
				 {'day'=> 3,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "cherries",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "milk",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 }
			]
		}

		@all_recipes = Recipe.find_in_api(@calories, @budget, @time)
		@daily_recipes = self.class.do_daily_recipes(@all_recipes)

		@day = "Monday"
		# return recipes for Monday (eventually second index will be replaced with day variable)
		@breakHash = @daily_recipes[1][@day]
		@breakTitle = @breakHash["title"]
		@breakCals = @breakHash["calories"]
		@breakTime = @breakHash["readyInMinutes"]
		@breakPrice = (@breakHash["price"] / 100).round(2)

		@lunchHash = @daily_recipes[2][@day]
		@lunchTitle = @lunchHash["title"]
		@lunchCals = @lunchHash["calories"]
		@lunchTime = @lunchHash["readyInMinutes"]
		@lunchPrice = (@lunchHash["price"] / 100).round(2)

		@dinHash = @daily_recipes[3][@day]
		@dinTitle = @dinHash["title"]
		@dinCals = @dinHash["calories"]
		@dinTime = @dinHash["readyInMinutes"]
		@dinPrice = (@dinHash["price"] / 100).round(2)
	end

	def self.do_daily_recipes(all_recipes)
		daily_recipes = Hash.new()

		# helper: display days instead of indexes
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

	def self.calc_calories(gender, weight, height, age, exercise, goal)
		#These calculations require kg and cm.  Will need to add
		#units to the form in the future.
		#Formula found here:
		#https://www.calculator.net/calorie-calculator.html
		weight = weight * 0.453592
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
		#https://www.livestrong.com/article/526442-the-activity-factor-for-calculating-calories-burned/

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

	def favorite_recipe
		current_user.recipes.create(:type => "FavoritedRecipe", :meal_type => params[:Type], :title => params[:Title], 
			:calories => params[:Calories], :time => params[:PrepTime], :cost => params[:Cost])
		current_user.save!
		redirect_to favorited_recipes_path
	end

	def favorited_recipes
		@favorited_recipes = current_user.recipes.where(:type => "FavoritedRecipe")
		@breakfast = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Breakfast")
		@lunch = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Lunch")
		@dinner = current_user.recipes.where(:type => "FavoritedRecipe", :meal_type => "Dinner")
	end
end
