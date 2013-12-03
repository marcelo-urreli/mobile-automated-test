Before do
	# Headless
	#@headless = Headless.new
	#@headless.start
	#@headless.destroy


	# Mobile Devices
	driver = Webdriver::UserAgent.driver(:browser => :firefox, :agent => :ipad, :orientation => :landscape)
	@browser = Watir::Browser.new driver

	# Web Browser
	#@browser=Watir::Browser.new :firefox, :profile => 'default'

	# User Agent
	#profile = Selenium::WebDriver::Firefox::Profile.new
	#profile['general.useragent.override'] = 'Nokia9210/2.0 Symbian-Crystal/6.1 Nokia/2.1'
	#@browser = Watir::Browser.new :firefox, :profile => profile
	end

After do
	@browser.close
end