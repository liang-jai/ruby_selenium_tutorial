
# this is bad example

require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

wait = Selenium::WebDriver::Wait.new(:timeout => 15)

select_list = wait.until { 
    element = browser.find_element(:name, "dropdown")
    element if element.displayed?
}
#select_list.clear

#browser.find_elements(:xpath => "html/body/form[3]/select/option").each do |r|
#    puts "dropdown " + r.text
#end


# Extract all options from the select box
options = select_list.find_element(:tag_name => "option")

puts "these are the options #{options.text} extracted"

#select the option "Volve"
options.each do |g|
    if g.text == "Volve"
       g.click
       break
    end
end

sleep 2

#select another option
options.each do |g|
    if g.text == "Audi"
       g.click
       break
    end
end

sleep 2

# Print currently selected options
options.each do |g|
    if g.selected?
       puts "this is current select #{g.text}"
    end
end

browser.quit




