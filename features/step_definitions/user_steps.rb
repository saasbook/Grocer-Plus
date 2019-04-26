Given /I am an existing user with email "(.*)" and password "(.*)" and age "(.*)" and height "(.*)" and weight "(.*)"/ do |email, password, age, height, weight|
	User.create(:email => email, :password => password, :age => age, :height => height, :weight => weight)
	user = User.find_by_email('john.apple@gmail.com')
	# @current_user = user
	# sign_in_as user
end

And /I favorite a "(.*)" meal/ do |meal_type|
	click_link ("Favorite " + meal_type)
end