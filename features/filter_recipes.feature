Feature: Display filtered recipes to user sorted into Breakfast, Lunch & Dinner categories

  As a user
  So that I can see meals curated to me
  I want to view options for a daily meal plan

Background: recipes are retrieved by the API from a database 

  Given the following recipes exist:
  |title			|day|slot|calories	|readyminutes|price	|
  |Eggs Benedict	|1	|1	 |200		|45			 |2		|
  |Sweet & Sour Soup|1	|2	 |340		|50			 |3		|
  |Mushroom Risotto	|1	|3	 |200		|75			 |8		|
  |Waffles			|2	|1	 |200		|45			 |8		|
  |Salad			|2	|2	 |200		|45			 |8		|
  |Burrito			|2	|3	 |200		|45			 |8		|
  |Grapes			|3	|1	 |200		|45			 |8		|
  |Cherries			|3	|2	 |200		|45			 |8		|
  |Milk				|3	|3	 |200		|45			 |8		|

  And I am on the GrocerPlus home page
  Then 9 seed recipes should exist 

Scenario: API call returns 3 breakfast recipes
  When I view the meals page
    And view the Breakfast section
  Then I should see "Eggs Benedict"
    And I should see "Waffles"
    And I should see "Grapes"

Scenario: API call returns 3 lunch recipes
  When I view the meals page
    And view the Lunch section
  Then I should see "Sweet & Sour Soup"
    And I should see "Salad"
    And I should see "Cherries"

Scenario: API call returns 3 dinner recipes
  When I view the meals page
    And view the Dinner section
  Then I should see "Mushroom Risotto"
    And I should see "Burrito"
    And I should see "Milk"

Scenario: API call returns no breakfast recipes
  When I view the meals page
    And view the Breakfast section
  Then I should see an empty section

Scenario: API call returns no lunch recipes
  When I view the meals page
    And view the Lunch section
  Then I should see an empty section

Scenario: API call returns no dinner recipes
  When I view the meals page
    And view the Dinner section
  Then I should see an empty section