#
#
# this is a more class version on selenium webdriver
# and actually uses the test::Unit::Testcase 
#
#

require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class ExampleTestCase < Test::Unit::TestCase
 
  # Starting browser before each test
  def setup
    @browser = Selenium::WebDriver.for :firefox
    @browser.get "file:///C:/Users/brian/selenium_ruby/web1.html"
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end
 
  # Closing browser after each test 
  def teardown
    @browser.quit
  end
 
  # Check that the table is there
  def test_table_existence
    assert @wait.until {
        @browser.find_element(:id, "booktable").displayed?
    }
  end
 
  # Checking values in the table cells
  def test_table_values
    # Waiting for the values to appear
    assert @wait.until {
        @browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[0].text.split(' ')[0] == "fraise"
    }
    assert @wait.until {
        @browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[0].text.split(' ')[1] == "orange"
    }
    # Not waiting for the values to appear, assuming they are already visible
    assert_equal(@browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[1].text.split(' ')[0], "vin")
    assert_equal(@browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[1].text.split(' ')[1], "eau")
    assert_not_equal(@browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[1].text.split(' ')[0], "fake")
  end
 
end