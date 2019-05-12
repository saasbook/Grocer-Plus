Feature: Edit user data and preferences

	As an existing user
	So that I can customize my profile on Grocer-Plus
	I want to input data and preferences about myself

	Background:

		Given I am logged in with email "john.apple@gmail.com" and password "hello1"
		And I am on the edit preferences page

		And I fill in "Height" with "180"
		And I fill in "Weight" with "80"
		And I fill in "Age" with "20"
		Then I press "Place Edits"

