Before do
	# Headless
	@headless = Headless.new
	@headless.start

	# Mobile Devices
	#driver = Webdriver::UserAgent.driver(:browser => :firefox, :agent => :android_phone, :orientation => :landscape)
	#@browser = Watir::Browser.new driver
	#@browser.window.move_to(1700,0)
	
	# Web Browser
	#@browser=Watir::Browser.new :firefox, :profile => 'default'

	# User Agent
	profile = Selenium::WebDriver::Firefox::Profile.new
	profile['general.useragent.override'] = 'Mozilla/5.0 (X11; U; Linux armv61; en-US; rv:1.9.1b2pre) Gecko/20081015 Fennec/1.0a1'
	@browser = Watir::Browser.new :firefox, :profile => profile
	
	@browser.goto $URL
	@browser.cookies.clear
	@browser.cookies.add 'downApp', 'downApp', :path => "/"
	end

After do
	@browser.close
	@headless.destroy
end