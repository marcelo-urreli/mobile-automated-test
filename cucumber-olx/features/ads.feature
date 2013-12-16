Feature: Post an Item

  	Scenario: Post an item
     Given I go to Home page
      When I click on Post button
        And I choose "Capital Federal" city
        And I choose "Teléfonos - Tablets" category
        And I choose "Teléfonos - Celulares" subcategory
        When I fill out the form with the following data:
          | name 						| value													|
	      | posting[title]    			| Borrar - Automated Test			       				|
	      | posting[description]   		| Automated Test - Description for Samsung Galaxy S4    |
	      | posting[optionals][price]   | 4000       											|
	      | posting[contactName]  		| Borrar       											|
	      | posting[email]   			| borrarmeasasdasdaa@gmail.com     						|
	      | posting[phone] 				| 1549897652 			  								|
	    And I press submit button
	Then I should see "Tu anuncio se ha enviado correctamente para su aprobación." text


	Scenario: Reply an ad
	 Given I go to Home page
	  When I log in with username "automatedtesting01" and password "dami21"
	   And I pick an existing ad
	   And I reply with a new message
	 Then I should see that message was received