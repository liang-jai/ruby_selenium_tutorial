
# This example gives the example of clicking a image link
# and validate that the new page is being displayed
#
#


require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)


if wait.until { browser.find_element(:xpath => "//img[@src='images/WaterFaucet.jpg']").displayed?}
    puts "Test Passed: Found a graphic with the path 'images/WaterFaucet.jpg' in the source filename" 
end

if wait.until { browser.find_element(:name, "watergraphic").displayed?}
    puts "Test Passed: Found a graphic with the name watergraphic" 
end

if wait.until { browser.find_element(:xpath => "//img[@alt='Image of water faucet']").displayed?}
    puts "Test Passed: Found a graphic with 'Image of water faucet' as alt text" 
end

image = wait.until {
    element = browser.find_element(:xpath => "//img[@src='images/totoro.gif']")
    element if element.displayed?
}
image.click

puts "Test Passed: click to yesasia Validated" if wait.until {
    /Follow us on Twitter/.match(browser.page_source)
}


browser.quit




