Feature: Location change

	Scenario: Change city location
	 Given I am located in "Argentina" country and "Capital Federal" city
	  When I change my location to "Catamarca" city
	Then I should be located on "Catamarca" city