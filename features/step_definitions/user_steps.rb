
Given /I am an existing user with email "(.*)" and password "(.*)" and age "(.*)" and height "(.*)" and weight "(.*)"/ do |email, password, age, height, weight|
	User.create(:email => email, :password => password, :age => age, :height => height, :weight => weight)
end
