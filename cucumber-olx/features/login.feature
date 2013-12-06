Feature: Login and Logout tests
 	
 	Scenario: Login to My OLX
     Given I go to Home page
      When I go to My Olx
      When I log in with username "damianb@olx.com" and password "dami21"
    Then I should be logged in

    Scenario: Logout from My OLX
     Given I am logged in
      When I click logout button
    Then I should be logged out

