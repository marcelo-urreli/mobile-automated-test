

When(/^I go to My Olx$/) do
	@browser.link(:href, '/auth/login').when_present.click
end


When(/^I click on Post button$/) do
  @browser.link(:href, '/item/post/category').when_present.click
end


Then(/^I should see my item posted$/) do
  @browser.div(:class, 'reply_to_ad_success').present?
  #browser.text.should include('Tu anuncio se ha enviado correctamente para su aprobación.')
  #http://m.olx.com.ar/item/show/559381346
end


Given(/^I go to whatsmyuseragent page$/) do
  @browser.goto 'http://whatsmyuseragent.com'
end

Given /^I am located in "(.*?)" country and "(.*?)" city$/ do |country, city|
  case country
    when 'Argentina'
      @browser.goto $argentina_url
    when 'Brasil'
      @browser.goto $brasil_url
    when 'South Africa'
      @browser.goto $za_url
    when 'India'
      @browser.goto $india_url
    else 
      return false
  end
  @browser.link(:class, 'select-city').click
  @browser.link(:text, city).click
  @browser.link(:text, city).exists?
end



When(/^I change my location to "(.*?)" city$/) do |new_city|
  @browser.link(:class, 'select-city').click
  @browser.link(:text, new_city).click
end


Then(/^I should be located on "(.*?)" city$/) do |city|
  @browser.link(:text, city).exists?
end


Given /^I go to register page$/ do
  %Q{ Given I go to Home page}
  @browser.link(:href, '/auth/login').when_present.click
  @browser.link(:href, '/registration/index/').click
end

# Fill Post form fields
When(/^I fill out the post form with valid data$/) do
  o = [('a'..'z'), ('0'..'9')].map { |i| i.to_a }.flatten
  string = (0...6).map{ o[rand(o.length)] }.join
  @browser.text_field(:name, 'register[username]').set 'QA' + string
  @browser.text_field(:name, 'register[email]').set 'automated_test' + string + '@hotmail.com'
  @browser.text_field(:name, 'register[password]').set 'automated'
  @browser.input(:name, 'register[agree_terms]').click
end

Then(/^I should be registered sucessfully$/) do
  @browser.text.should include('Mi OLX')
end



And /^I pick an existing ad$/ do
  if @browser.url != $URL
   @browser.goto $URL
  end
  @browser.text_field(:id, 'searchField').set "Blackberry 8520 - Testing"
  @browser.button(:type, 'submit').click
  @browser.link(:href, '/item/show/559384350').click
end



And /^I reply with a new message$/ do
  @browser.link(:href, '/item/reply/559384350').when_present.click
  %Q{
    When I fill out the form with the following data:
        | name               | value                               |
        | replytoad[email]   | automatedtesting01@olx.com          |
        | replytoad[name]    | Automated Replier                   |
        | replytoad[phone]   | 1532340200                          |
        | replytoad[message] | This is automatic reply for testing |
    }
  @browser.button(:name, 'submit').click
end

Then /^I should see that message was received$/ do
  @browser.div(:class, 'reply_to_ad_success').exists?
end