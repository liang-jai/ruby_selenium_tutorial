#this is example 

require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#add text to a text box
input = wait.until {
    element = browser.find_element(:name, "searchbox")
    element if element.displayed?
}

input.send_keys("Information")

#check to see if the form exists:
form = wait.until {
    element = browser.find_element(:name, "submit")
    element if element.displayed?
}

puts "Test Passed: submit button found" if form.displayed?

#click on the button
form.click


browser.quit

