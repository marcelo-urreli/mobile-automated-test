Feature: As a User i want to perform a search in order to find items

	Scenario: Search from HOME page
	  Given I go to Home page
	   When I search for "samsung" in "Home" page
	  Then I should see all results for that item in "Home" page


	Scenario: Search from CATEGORY page
	  Given I go to Home page
	   When I search for "samsung" in "Teléfonos - Tablets" page
	  Then I should see all results for that item in "Teléfonos - Tablets" page


	Scenario: Search from SUBCATEGORY page
	  Given I go to Home page
	   When I search for "samsung" in "Teléfonos - Celulares" page
	  Then I should see all results for that item in "Teléfonos - Celulares" page
