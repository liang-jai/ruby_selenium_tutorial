

require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#check to see if the radio button exist

if wait.until { browser.find_element(:name, "radiobutton1").displayed? }
    puts "Tests Passed: Radio Button found"
end

#change the state of the Radio Buttons
cb1 = wait.until {
    element = browser.find_element(:name, "radiobutton1")
    element if element.displayed?
}
cb1.click if cb1.selected? == false

cb3 = wait.until {
    element = browser.find_element(:name, "radiobutton3")
    element if element.displayed?
}
cb3.click if cb3.selected? == false
 

puts "test Passed...radio1 selected" if cb1.selected? == true

puts "test Passed...radio3 selected" if cb3.selected? == true

browser.quit