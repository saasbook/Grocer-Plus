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
