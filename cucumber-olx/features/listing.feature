Feature: As a User i want to perform a search in order to find items

	Scenario: Search from HOME page
	  Given I go to Home page
	   When I search for "samsung" in Home page
	  Then I should see all results


#	Scenario: Search from CATEGORY page
#	  Given I go to Home page
#	   When I go to "Teléfonos - Tablets" category
#	    And I search for "Blackberry 8520 - Testing edition"
#	  Then I should see "Blackberry 8520 - Testing edition" item found


#	Scenario: Search from SUBCATEGORY page
#	  Given I go to Home page
#	   When I go to "Teléfonos - Tablets" category
#		And I search for "Blackberry 8520 - Testing edition"
#	  Then I should see "Blackberry 8520 - Testing edition" item found