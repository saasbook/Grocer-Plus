Given("the following recipes exist:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
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
				 'title' => "Waffles",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Salad",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Burrito",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "Grapes",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8
				 },
				 {'day'=> 3,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Cherries",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Milk",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 }
			]
		}
	@no_breakfast = {'items' => 
				[
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
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Salad",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Burrito",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Cherries",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Milk",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 }
			]
		}
	@no_lunch = {'items' => 
				[
				{'day' => 1,
			 	'slot' => 1,
			 	'id' => 123456,
			 	'title' => "Eggs Benedict",
			 	'calories' => 200,
			 	'readyInMinutes' => 45,
				 'price' => 2
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
				 'title' => "Waffles",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Burrito",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "Grapes",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8
				 },
				 {'day'=> 3,
				 'slot' => 3,
				 'id' => 123456,
				 'title' => "Milk",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 }
			]
		}
	@no_dinner = {'items' => 
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
				 {'day'=> 2,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "Waffles",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 2,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Salad",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 },
				 {'day'=> 3,
				 'slot' => 1,
				 'id' => 123456,
				 'title' => "Grapes",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8
				 },
				 {'day'=> 3,
				 'slot' => 2,
				 'id' => 123456,
				 'title' => "Cherries",
				 'calories' => 200,
				 'readyInMinutes' => 45,
				 'price' => 8	
				 }
			]
		}
end

Then("{int} seed recipes should exist") do |int|
	@all_recipes['items'].length.should == int
end

When("API call returns 3 breakfast recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@all_recipes)
end

When("API call returns 3 lunch recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@all_recipes)
end

When("API call returns 3 dinner recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@all_recipes)
end

When("API call returns no breakfast recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@no_breakfast)
end

Then("I should see nothing in breakfast") do
	@daily_recipes[1].should == nil
end

When("API call returns no lunch recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@no_lunch)
end

Then("I should see nothing in lunch") do
	@daily_recipes[2].should == nil
end

When("API call returns no dinner recipes") do
	@daily_recipes = UsersController.do_daily_recipes(@no_dinner)
end

Then("I should see nothing in dinner") do
	@daily_recipes[3].should == nil
end

Then("I should see {string} in breakfast") do |string|
	@daily_recipes.values.should have_content string
end

Then("I should see {string} in lunch") do |string|
	@daily_recipes.values.should have_content string
end

Then("I should see {string} in dinner") do |string|
	@daily_recipes.values.should have_content string
end

Then("I should see {int} recipes in lunch") do |int|
	@daily_recipes[2].length.should == int
end

Then("I should see {int} recipes in dinner") do |int|
	@daily_recipes[3].length.should == int
end

Then("I should see {int} recipes in breakfast") do |int|
	@daily_recipes[1].length.should == int
end