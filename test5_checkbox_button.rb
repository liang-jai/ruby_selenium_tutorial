# This example is for checkout
# and click button.
#


require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#take this out
#cb = browser.find_element(:name, "checkthebox")

#verify is the checkbox exists
cb = wait.until {
    element = browser.find_element(:name, "checkthebox")
    element if element.displayed?
}

#checks 
cb.click

if cb.selected? == true
    puts "Test Passed: the checkbox is selected"
end

sleep 2

#unchecks 
cb.click

if cb.selected? == false
    puts "Test Passed: the checkbox is unselected"
end

browser.quit