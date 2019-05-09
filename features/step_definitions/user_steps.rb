# Given /I am an existing user with email "(.*)"/ do |email|
# 	User.create(:email => email, :password => password, :age => age, :height => height, :weight => weight, :time => time)
# 	user = User.find_by_email('john.apple@gmail.com')
# 	# @current_user = user
# 	# sign_in_as user
# end

Given /a user exists/ do
	user = create(:user)
	user.save!
end

And /I favorite a "(.*)" meal/ do |meal_type|
	click_link ("Favorite " + meal_type)
end