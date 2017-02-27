
# JavaScript not really working...
# this script sucks
#
#


require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"

wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#execute 1stJavaScript function on the page and Cancel the prompt box
#browser.execute_script('enter_name()')
#a_box = browser.switch_to.alert
#a_box.dismiss


#if a_box == 'Please enter your name'
#    a_box.dismiss
#else
#    a_box.accept
#end


# Execute 2nd JavaScript function on the page and Accept the prompt box
browser.execute_script("enter_age()")
a = browser.switch_to.alert
if a.text == 'Please enter your name'
  a.dismiss
else
  a.send_keys("99")
  a.accept
end





browser.quit
