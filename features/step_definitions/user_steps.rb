# Given /I am an existing user with email "(.*)"/ do |email|
# 	User.create(:email => email, :password => password, :age => age, :height => height, :weight => weight, :time => time)
# 	user = User.find_by_email('john.apple@gmail.com')
# 	# @current_user = user
# 	# sign_in_as user
# end

api_result = {"items"=>[{"day"=>1, "value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Peanut Butter Swirl Banana Bread\"}", 
"slot"=>1, "id"=>123456, "title"=>nil, "calories"=>50, "totalTime"=>45, "yield"=>4, "readyInMinutes"=>45}, 
{"day"=>1, "value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Peanut Butter Swirl Banana Bread\"}", "slot"=>2, "id"=>123456, 
"title"=>nil, "calories"=>50, "totalTime"=>45, "yield"=>4, "readyInMinutes"=>45}, {"day"=>1, 
"value"=>"{\"id\":655340,\"imageType\":\"jpg\",\"title\":\"Peanut Butter Swirl Banana Bread\"}", "slot"=>3, "id"=>123456, "title"=>nil, 
"calories"=>50, "totalTime"=>45, "yield"=>4, "readyInMinutes"=>45}]}

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

And /I favorite a "(.*)" meal/ do |meal_type|
	click_link ("Favorite " + meal_type)
end