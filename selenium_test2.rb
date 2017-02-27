#<title>Testing with Ruby and Selenium WebDriver</title>
 

#<img src="images/freebsd_daemon.jpg">
#<h2>
 
#Version 1.0</h2><h1>

#Test Automation Training</h1><h3>
#Testing Web Applications with Ruby and Selenium WebDriver</h3>

# http://anahorny.blogspot.com/2011/08/selenium-webdriver-ruby-test-automation.html


require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"
 
# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# Find text on the page by regexp
puts "Test Passed: Page 1 Validated" if wait.until {
    /Testing Web Applications with Ruby and Selenium WebDriver/.match(browser.page_source)
}
 
browser.quit

#puts browser.page_source