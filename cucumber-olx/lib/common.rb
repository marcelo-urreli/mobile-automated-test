require 'configure'

# Common steps


# UI Validation
Then /^I should see "(.+)" text$/ do |search_string|
  @browser.text.include?(search_string).should == true
end

Then /^I should not see "(.+)" text$/ do |search_string|
  @browser.text.include?(search_string).should == false
end


# Login to My OLX
Given /^I go to Home page$/ do
  if @browser.url != URL
    @browser.goto URL
  end
end

When /^I log in with username "(.+)" and password "(.+)"$/ do |username, password|
	@browser.link(:href, '/auth/login').when_present.click
	@browser.text_field(:name, 'login[username]').set username
	@browser.text_field(:name, 'login[password]').set password
	@browser.button(:name, 'submit').click
end

Then /^I should be logged in$/ do
  @browser.text.should include('Mi OLX')
end


#Logout
Given /^I am logged in$/ do
  if @browser.link(:href, '/auth/login').exists?
      steps %Q{
      Given I go to Home page
      When I go to My Olx
      When I log in with username "damianb@olx.com" and password "dami21"
      Then I should be logged in
      }
  end
end

When /^I click logout button$/ do
  @browser.link(:href, /user\/logout/).click
end

Then(/^I should be logged out$/) do
  @browser.link(:href, /auth\/login/).exists? == true
end





# Cities - Categories - Subcategories access
When /^I choose "(.+)" city$/ do |city|
  @browser.link(:text, city).click
end

When /^I choose "(.+)" category$/ do |category|
  @browser.link(:text, category).click
end

When /^I choose "(.+)" subcategory$/ do |subcategory|
  @browser.link(:text, subcategory).click
end


# Fill form fields
When /^I fill out the form with the following data:$/ do |text_fields|
  text_fields.hashes.each do |hash|
    key   = hash.values[0]
    value = hash.values[1]
    @browser.text_field(:name, key).set(value)
  end
end


# Button actions
And /^I press submit button$/ do
	@browser.button(:name, 'submit').click
end



And /^I log out$/ do
 if @browser.link(:class, 'sign-out').exist? == true
  @browser.link(:class, 'sign-out').when_present.click
 else
  return false
 end
end




