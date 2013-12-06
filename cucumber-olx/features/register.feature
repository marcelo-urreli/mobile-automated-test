Feature: Register user

	Scenario: Register new user
	 Given I go to register page
	   When I fill out the post form with valid data
		 And I press submit button
	 Then I should be registered sucessfully