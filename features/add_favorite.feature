Feature: Add favorite recipes

    As an existing user
    So that I can select recipes that I like
    I should be able to favorite a recipe

Background:
    Given I am logged in
    And I am on the show page

Scenario: Favoriting a recipe causes it to appear on Favorites page
    When I favorite "Peanut Butter Swirl Banana Bread"
    Then I should be on the favorites page
    And I should see "Peanut Butter Swirl Banana Bread"

Scenario: Favoriting a recipe twice does not cause the recipe to appear twice on Favorites page
    When I favorite "Peanut Butter Swirl Banana Bread"
    And I go to the show page
    And I favorite "Peanut Butter Swirl Banana Bread"
    Then I should see "Peanut Butter Swirl Banana Bread" exactly once



