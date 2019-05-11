Feature: Grocery Lists for Recipes in Meal Plan

    As a user
    So that I can see groceries I need for the recipes in my recommended meal plan
    I should be able to view a grocery list for each recipe

Background:
    Given I am logged in

Scenario: Grocery lists appear on grocery list page

    When I am on the grocery list page
    Then I should see "5 tomatoes, cored and quartered" exactly three times
