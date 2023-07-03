require 'selenium-webdriver' # Import Selenium WebDriver gem
require "yaml" # Import yaml gem

# Before scenario hook
Before do |scenario|
    puts "============= " + scenario.name + " ==================="
    # Load the config YAML file
    config = YAML.load_file(File.expand_path("../../../config/config.yml", __FILE__))

    # Set the path to the chromedriver executable.
    Selenium::WebDriver::Chrome::Service.driver_path = "./Drivers/chromedriver.exe"

    # Create ChromeOptions object to set desired capabilities.
    chromeOptions = Selenium::WebDriver::Chrome::Options.new

    # Create a new instance of the Chrome driver, and pass the chromeOptions.
    $driver = Selenium::WebDriver.for :chrome, options: chromeOptions # @@driver is a global variable

    # Maximise the window.
    $driver.manage.window.maximize
end

# After scenario hook
After do |scenario|
    puts "================== Scenario End ========================"
    sleep(2) # Wait 2 seconds before closing the browser 
    $driver.quit  # Quit the driver.
end

# After hook only for scnearios with @Regression tag
Before('@Regression') do |scenario|
    puts "            <<< Regression Test >>>"
end