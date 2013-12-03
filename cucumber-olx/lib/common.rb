
# Common steps

# UI Validation

Then /^I should see "(.+)" text$/ do |search_string|
  @browser.text.include?(search_string).should == true
end

Then /^I should not see "(.+)" text$/ do |search_string|
  @browser.text.include?(search_string).should == false
end


# Login to My OLX


Given /^I log in with a username "(.+)" and password "(.+)"$/ do |username, password|
	@browser.goto #{environment}
	@browser.cookies.add 'downApp', 'downApp', :path => "/"
	@browser.link(:href, '/auth/login').when_present.click
	@browser.text_field(:name, 'login[username]').set username
	@browser.text_field(:name, 'login[password]').set password
	@browser.button(:name, 'submit').click
	@browser.text.should include('Mi OLX')
end



#And /^I log out$/ do
#  begin
#    Core::Login_Page.logout(@browser, @config)
#  rescue
#    raise("#{@browser.browser_type_and_version}: Failed to logout")
#  end
#end	


######  Global Variables

# Config


# Countries

$URL='http://m.olx.com.ar'

$arg_url='http://m.olx.com.ar'
$india_url='http://m.olx.in'
za_url='http://m.olx.co.za'
