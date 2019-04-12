Feature: Sign up for Grocer-Plus

	As a new user
	So that I can use Grocer-Plus
	I want to sign up with my email and a password

Background:

	Given I am on the signup page

Scenario: Sign up with proper credentials

	When I fill in "user[email]" with "john.apple@gmail.com"
	And I fill in "user[password]" with "hello1"
	And I fill in "user[password_confirmation]" with "hello1"
	And I press "Sign up"
	Then I should see "Enter dietary restrictions and preferences here"


Scenario: Sign up with improper credentials

	When I fill in "user[email]" with "1234"
	And I fill in "user[password]" with "1234567"
	And I fill in "user[password_confirmation]" with "1234567"
	And I press "Sign up"
	Then I should not see "Enter dietary restrictions and preferences here"
	And I should see "Email"
	And I should see "Password"
	And I should see "Password confirmation"
	And I should see "Sign up"

Scenario: Sign up with different passwords

	When I fill in "user[email]" with "cjang000@gmail.com"
	And I fill in "user[password]" with "1234567"
	And I fill in "user[password_confirmation]" with "12345678"
	And I press "Sign up"
	Then I should not see "Enter dietary restrictions and preferences here"
	And I should see "Sign up"
	And I should see "Password confirmation doesn't match Password"
	And I should see "Password"


Scenario: Sign up with a short password

	When I fill in "user[email]" with "cjang000@gmail.com"
	And I fill in "user[password]" with "1234"
	And I fill in "user[password_confirmation]" with "1234"
	And I press "Sign up"
	Then I should not see "Enter dietary restrictions and preferences here"
	And I should see "Sign up"
	And I should see "Password is too short (minimum is 6 characters)"
	And I should see "Password"




     
