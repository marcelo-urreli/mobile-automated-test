Feature: Go to Home page

# Scenario: Go to Home page and check it
#    Given I go to Home page
#      When I go to My Olx
#        And I complete login information
#    Then I should be logged in

  Scenario: Post an item
    Given I go to Home page
      When I click on Post button
       And I choose Capital Federal
        And I choose Telefonos - Tablets category
        And I choose Telefonos - Celulares
        And I submit all post information
    Then I should see "Tu anuncio se ha enviado correctamente para su aprobación." text

#  Scenario: Check user agent
#    Given I go to whatsmyuseragent page