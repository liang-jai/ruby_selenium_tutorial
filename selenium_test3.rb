
# this is the Locators to test for all webpage locations with Xpath
# and also click on the link to another page. 

require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#puts "Test Passed: Link with the href 'http://www.elegantcode.com/' found by XPATH" if wait.until {
#    browser.find_element(:xpath => "//a[@href='http://www.elegantcode.com/']").displayed?
#}

if wait.until{browser.find_element(:xpath => "//a[@href='http://www.elegantcode.com/']").displayed?}
    puts "Test Passed: Link with the href 'http://www.elegantcode.com/' found by XPATH"
end

#puts "Test Passed: Link with the id '2' found by XPATH" if wait.until {
#    browser.find_element(:xpath => "//a[@id='2']").displayed?
#}

#xpath
if wait.until {browser.find_element(:xpath => "//a[@id='2']").displayed?}
    puts "Test Passed: Link with the id '2' found by XPATH"
end

#puts "Test Passed: Link with the name 'slashdotlink' found by NAME locator" if wait.until {
#    browser.find_element(:name => "slashdotlink").displayed?
#}

#name
if wait.until { browser.find_element(:name => "slashdotlink").displayed?}
    puts "Test Passed: Link with the name 'slashdotlink' found by NAME locator"
end

if wait.until {browser.find_element(:id => 4).displayed?}
    puts "Test Passed: Link with the id '4' found by ID locator"
end

 if wait.until { browser.find_element(:id, 1).displayed?}
    puts "Display the text for link 1: " + browser.find_element(:id, 1).text
 end
 
 
 # Direct match
if wait.until {browser.find_element(:id, 2).text == 'Yahoo'}
    puts "Test Passed: Link with id 2 and text containing the text 'Yahoo' found" 
end
 
 # Regexp match
if wait.until { browser.find_element(:id, 2).text =~ /hoo/}
    puts "Test Passed: Link with id 2 and text containing the text '...hoo...' found" 
end
 
 
link = wait.until {
    element = browser.find_element(:id,3)
    element if element.displayed?
}

link.click
 
# Check that the link with the given title is displayed
 if wait.until {browser.find_element( :xpath => 'html/body/div[2]/div[1]/nav[1]/h1/a').displayed?}
    puts "Test Passed: News for nerds, stuff that matters found"
 end
 

browser.quit