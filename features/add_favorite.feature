Feature: Add favorite recipes

    As an existing user
    So that I can select recipes that I like
    I should be able to favorite a recipe

    Background:

        Given I am logged in with email "john.apple@gmail.com" and password "hello1"
        And I am on the show page

    Scenario: Favorite recipe

        Given that I am on the Recommended Weekly Meal Plan page
        And I press the Like button on a recipe
        And I go to my Favorited Meals
        Then I should see the recipe