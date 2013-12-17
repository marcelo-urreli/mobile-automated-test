#!/bin/env ruby
# encoding: utf-8


When /^I search for "(.*?)" in "(.*?)" page$/ do |item, page|
  @search_item = item

   case page
  when 'Home'
    if @browser.url != $URL
      @browser.goto $URL
    end
  when 'Teléfonos - Tablets'
    category = '830'
    @browser.link(:href, /#{category}/).click
  when 'Teléfonos - Celulares'
    category = '831'
    @browser.link(:href, /830/).click
    @browser.link(:href, /#{category}/).click
  else
    category = 'null'
 end

  @browser.text_field(:id, 'searchField').set @search_item
  @browser.button(:type, 'submit').click
end



Then /^I should see all results for that item in "(.*?)" page$/ do |page|
 case page
  when 'Home'
    category = '%22%22'
  when 'Teléfonos - Tablets'
    category = '830'
  when 'Teléfonos - Celulares'
    category = '831'
  else
    category = 'null'
 end


 uri = URI.parse('http://api-v2.olx.com/items?location=www.olx.com.ar&categoryId=' + category + '&searchTerm=' + @search_item + '&pageSize=20&offset=0')
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
    if response.code == "200"
      result = JSON.parse(response.body)
      data = result["data"]
      data.each do |section|
        if (@browser.link(:href, '/item/show/' + section["id"].to_s).exists? == true) && (@browser.h3(:text, section["title"].to_s).exists? == true)
          puts 'Item ID: ' + section["id"].to_s + ' with title ' + section["title"].to_s + ' exists'  
        end    
      end
    else
      puts 'No item found!'
    end
end
