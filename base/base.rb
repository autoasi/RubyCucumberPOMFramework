require 'selenium-webdriver' # Import Selenium WebDriver gem
require "yaml" # Import yaml gem
require 'test/unit' # Import test-unit gem

class TestBase < Test::Unit::TestCase

    # Setup method will execute once before each test method
    def setup
        # Load the config YAML file
        config = YAML.load_file(File.expand_path("../../Config/config.yml", __FILE__))

        # Set the path to the chromedriver executable.
        Selenium::WebDriver::Chrome::Service.driver_path = "./drivers/chromedriver.exe"

        # Create ChromeOptions object to set desired capabilities.
        chromeOptions = Selenium::WebDriver::Chrome::Options.new

        # Create a new instance of the Chrome driver, and pass the chromeOptions.
        @@driver = Selenium::WebDriver.for :chrome, options: chromeOptions # @@driver is a class variable

        # Maximise the window.
        @@driver.manage.window.maximize

        # Launch the browser.
        @@driver.get(config['applicationURL'])
    end

    # Teardown method will execute ones after each test method
    def teardown
        @@driver.quit
    end

end