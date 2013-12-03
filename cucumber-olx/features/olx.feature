Feature: Go to Home page

# Scenario: Enter to My OLX
#    Given I go to Home page
#      When I go to My Olx
#      When I log in with username "damianb@olx.com" and password "dami21"
#    Then I should be logged in

  Scenario: Post an item
    Given I go to Home page
      When I click on Post button
       And I choose "Capital Federal" city
        And I choose "Teléfonos - Tablets" category
        And I choose "Teléfonos - Celulares" subcategory
        When I fill out the form with the following attributes:
	      | posting[title]    			| Automated Test - Samsung Galaxy S4       				|
	      | posting[description]   		| Automated Test - Description for Samsung Galaxy S4    |
	      | posting[optionals][price]   | 4000       											|
	      | posting[contactName]  		| QA Team       										|
	      | posting[email]   			| olxtestingmail@gmail.com       						|
	      | posting[phone] 				| 1549897652 			  								|
	    And I press submit button
	Then I should see "Tu anuncio se ha enviado correctamente para su aprobación." text

#  Scenario: Check user agent
#    Given I go to whatsmyuseragent page