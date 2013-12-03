
Given(/^I go to Home page$/) do
	@browser.goto $URL
	@browser.cookies.add 'downApp', 'downApp', :path => "/"
end


When(/^I go to My Olx$/) do
	@browser.link(:href, '/auth/login').when_present.click
end


And(/^I complete login information$/) do
	@browser.text_field(:name, 'login[username]').set 'damianb@olx.com'
	@browser.text_field(:name, 'login[password]').set 'dami21'
	@browser.button(:name, 'submit').click
end



Then(/^I should be logged in$/) do
	@browser.text.should include('Mi OLX')
end



When(/^I click on Post button$/) do
  @browser.link(:href, '/item/post/category').when_present.click
end


When(/^I choose Capital Federal$/) do
  @browser.link(:href, '/item/post/category?state=capitalfederal-gba.olx.com.ar&city=capitalfederal.olx.com.ar').click
end


When(/^I choose Telefonos \- Tablets category$/) do
  @browser.link(:href, '/item/post/subcategory/830').when_present.click
end


When(/^I choose Telefonos \- Celulares$/) do
  @browser.link(:href, '/item/post/info/831').when_present.click
end


When(/^I submit all post information$/) do
  @browser.text_field(:name, 'posting[title]').set 'Automated Test - Samsung Galaxy S4'
  @browser.text_field(:name, 'posting[description]').set 'Automated Test - Description for Samsung Galaxy S4'
  @browser.text_field(:name, 'posting[optionals][price]').set '4000'
  @browser.text_field(:name, 'posting[contactName]').set 'QA Team'
  @browser.text_field(:name, 'posting[email]').set 'monnnnnnnnnnn@gmail.com'
  @browser.text_field(:name, 'posting[phone]').set '19231923'
  @browser.button(:name, 'submit').click
end


Then(/^I should see my item posted$/) do
  @browser.div(:class, 'reply_to_ad_success').present?
  #browser.text.should include('Tu anuncio se ha enviado correctamente para su aprobación.')
  #http://m.olx.com.ar/item/show/559381346
end


Given(/^I go to whatsmyuseragent page$/) do
  @browser.goto 'http://whatsmyuseragent.com'
end
