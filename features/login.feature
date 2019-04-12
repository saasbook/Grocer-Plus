Feature: Login to Grocer-Plus

	As an existing user
	So that I can use Grocer-Plus
	I want to log in with my email and password

Background:

	Given I am an existing user with email "john.apple@gmail.com" and password "hello1" and age "18" and height "160" and weight "60"
  	And I am on the login page

Scenario: Log in with proper credentials

	When I fill in "user[email]" with "john.apple@gmail.com"
	And I fill in "user[password]" with "hello1"
	And I press "Log in"
	Then I should see "Log Out"


Scenario: Attempting to log in with improper credentials fails

	When I fill in "user[email]" with "john.apple@gmail.com"
	And I fill in "user[password]" with "goodbye"
	And I press "Log in"
	Then I should not see "Log Out"