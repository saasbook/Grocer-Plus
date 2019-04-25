Feature: Display filtered recipes to user sorted into Breakfast, Lunch & Dinner categories

  As a user
  So that I can see meals curated to me
  I want to view options for a daily meal plan

Background: recipes are retrieved by the API from a database 

  Given the following recipes exist:
  |daily|slot|id	|title				|calories	|readyInMinutes	|price	|
  |1	|1	 |123456|Eggs Benedict		|200		|45			 	|2		|
  |1	|2	 |123456|Sweet & Sour Soup	|340		|50			 	|3		|
  |1	|3	 |123456|Mushroom Risotto	|200		|75			 	|8		|
  |2	|1	 |123456|Waffles			|200		|45			 	|8		|
  |2	|2	 |123456|Salad				|200		|45			 	|8		|
  |2	|3	 |123456|Burrito			|200		|45			 	|8		|
  |3	|1	 |123456|Grapes				|200		|45			 	|8		|
  |3	|2	 |123456|Cherries			|200		|45			 	|8		|
  |3	|3	 |123456|Milk				|200		|45			 	|8		|

  And I am on the home page
  Then 9 seed recipes should exist 

Scenario: API call returns 3 breakfast recipes
  When API call returns 3 breakfast recipes
  Then I should see "Eggs Benedict" in breakfast
    And I should see "Waffles" in breakfast
    And I should see "Grapes" in breakfast

Scenario: API call returns 3 lunch recipes
  When API call returns 3 lunch recipes
  Then I should see "Sweet & Sour Soup" in lunch
    And I should see "Salad" in lunch
    And I should see "Cherries" in lunch

Scenario: API call returns 3 dinner recipes
  When API call returns 3 dinner recipes
  Then I should see "Mushroom Risotto" in dinner
    And I should see "Burrito" in dinner
    And I should see "Milk" in dinner

Scenario: API call returns no breakfast recipes
  When API call returns no breakfast recipes
  Then I should see nothing in breakfast

Scenario: API call returns no lunch recipes
  When API call returns no lunch recipes
  Then I should see nothing in lunch

Scenario: API call returns no dinner recipes
  When API call returns no dinner recipes
  Then I should see nothing in dinner