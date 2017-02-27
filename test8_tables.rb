

# this is an example for tables
# checking displays on the table.

require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

wait = Selenium::WebDriver::Wait.new(:timeout => 15)

# Check that the table with the given id is displayed
table = wait.until {
    element = browser.find_element(:id, "booktable")
    element if element.displayed?
}
puts "Test Passed: Book Table found" if table

# Print full table contents
puts "Table with id=booktable:\n" + table.text

# Iterate through all cells of the table
browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr/td").each do |r|
    puts "Cell Value: " + r.text
end

# Print the value from the 1'st column of the 2'nd row of the table
puts "Value from the 1'st column of the 2'nd row of the table: " + browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[1].text.split(' ')[0]
 
# Print the value from the 2'nd column of the 1'st row of the table
puts "Value from the 2'nd column of the 1'st row of the table: " + browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[0].text.split(' ')[1]
 

browser.quit













