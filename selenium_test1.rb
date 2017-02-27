

# gem install selenium-webdriver
# brew install geckodriver
# export PATH=$PATH:/path/to/geckodriver
# http://anahorny.blogspot.com/2011/08/selenium-webdriver-ruby-tutorial.html

require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Selenium Tutorials"
element.submit

sleep 5

puts "this current_url:"
puts driver.current_url

puts "this is title:"
puts driver.title

puts "done!"

driver.quit