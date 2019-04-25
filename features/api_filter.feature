Feature: Edit user data and preferences

	As a user
    So that I can see meals that correspond to my budget and time available to cook
    I should see meals filtered based on my preferences


Background:
    Given user data and preferences result in the following database:
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
    Then 9 recipes should exist



Scenario: API is able to be filtered through readyInMinutes
    When API call filters breakfast recipes that take less than 60 minutes
    Then I should see "Eggs Benedict" in breakfast
    And I should see "Waffles" in breakfast
    And I should see "Grapes" in breakfast
    And I should not see "Mushroom Risotto" in breakfast



Scenario: API doesn't filter for anything other than numbers
    When API call filters breakfast recipes that take less than 'A' minutes
    Then I should not see "Eggs Benedict" in breakfast
    And I should not see "Waffles" in breakfast
    And I should not see "Grapes" in breakfast
    And I should not see "Mushroom Risotto" in breakfast

