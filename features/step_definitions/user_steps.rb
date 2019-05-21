api_result = {"items"=>[{"day"=>1, "value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Peanut Butter Swirl Banana Bread\"}", 
"slot"=>1, "id"=>123456, "title"=>"Peanut Butter Swirl Banana Bread", "calories"=>50, "totalTime"=>45, "yield"=>4, "links" => ["hi.com", "yo.com"], "readyInMinutes"=>45, "groceries"=> [
	{
	  "text": "6 cups watermelon chunks, seeded",
	  "weight": 924.0
	},
	{
	  "text": "5 tomatoes, cored and quartered",
	  "weight": 615.0
	},
	{
	  "text": "1 tablespoon sweet smoked paprika",
	  "weight": 6.8
	}
]}, 
{"day"=>1, "value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Chicken Pot Pie\"}", "slot"=>2, "id"=>123456, 
"title"=>"Peanut Butter Swirl Banana Bread", "calories"=>50, "totalTime"=>45, "yield"=>4, "links" => ["hi.com", "yo.com"], "readyInMinutes"=>45, "groceries"=> [
	{
	  "text": "6 cups watermelon chunks, seeded",
	  "weight": 924.0
	},
	{
	  "text": "5 tomatoes, cored and quartered",
	  "weight": 615.0
	},
	{
	  "text": "1 tablespoon sweet smoked paprika",
	  "weight": 6.8
	}
]}, {"day"=>1, 
"value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Mac and Cheese\"}", "slot"=>3, "id"=>123456, "title"=>"Mac and Cheese", 
"calories"=>50, "totalTime"=>45, "yield"=>4, "readyInMinutes"=>45, "links" => ["hi.com", "yo.com"], "groceries"=> [
	{
	  "text": "6 cups watermelon chunks, seeded",
	  "weight": 924.0
	},
	{
	  "text": "5 tomatoes, cored and quartered",
	  "weight": 615.0
	},
	{
	  "text": "1 tablespoon sweet smoked paprika",
	  "weight": 6.8
	}
]}]}

Given /a user exists/ do
	user = create(:user)
	Recipe.stub(:find_in_api).and_return(api_result)
end

Given /I am logged in/ do
	steps %{
		Given a user exists
		And I am on the login page
		When I fill in "user[email]" with "john.apple@gmail.com"
		And I fill in "user[password]" with "hello1"
		And I press "Log in"
	}
end

When /I favorite "Peanut Butter Swirl Banana Bread"/ do
	click_link ("Favorite Breakfast")
end

Then /I should see "(.*)" exactly once/ do |favorited_meal|
	expect(page.has_text?(favorited_meal, :count => 1))
end

Then /I should see "(.*)" exactly three times/ do |grocery|
	expect(page.has_text?(grocery, :count => 3))
end