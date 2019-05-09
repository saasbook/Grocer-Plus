Feature: Add favorite recipes

    As an existing user
    So that I can select recipes that I like
    I should be able to favorite a recipe

Background:
    Given I am logged in
    And I am on the show page

Scenario: Favorite recipe
    When I favorite a "Breakfast" meal
    Then I should see "Favorites"



