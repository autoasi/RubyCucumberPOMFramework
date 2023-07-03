require 'selenium-webdriver' # Import Selenium WebDriver gem
require "yaml" # Import yaml gem
require './page/RegistrationFormPage.rb'

  Given('user navigates to the registration form page') do
    puts "user navigates to the registration form page"
    # Load the config YAML file
    config = YAML.load_file(File.expand_path("../../../Config/config.yml", __FILE__))
    $driver.get(config['applicationURL']) # Navigate to the registration form page
    @registrationFormPage = RegistrationFormPage.new $driver
  end
  
  When('user enters {string} in first Name field') do |firstName|
    puts "user enters #{firstName} in first Name field"
    @registrationFormPage.enterFirstName(firstName)
  end
  
  When('user enters {string} in Last Name field') do |lastName|
    puts "user enters #{lastName} in Last Name field"
    @registrationFormPage.enterLastName(lastName)
  end
  
  When('user enters {string} in username field') do |username|
    puts "user enters #{username} in username field"
    @registrationFormPage.enterUsername(username)
  end
  
  When('user enters {string} in password field') do |password|
    puts "user enters #{password} in password field"
    @registrationFormPage.enterPassword(password)
  end

  When('user enters {string} in Email field') do |email|
    puts "user enters #{email} in Email field"
    @registrationFormPage.enterEmail(email)
  end
  
  When('user enters additional info in field') do |doc_string|
    puts "user enters additional info in field"
    @registrationFormPage.enterAdditionalInfo(doc_string)  
  end
  
  When('user clicks on submit button') do
    puts "user clicks on submit button"
    @registrationFormPage.clickSubmitBtn()
  end
  
  Then('user should see a the message {string} in the registration form') do |messageInfo|
    puts "user should see a the message #{messageInfo} in the registration form"
    sleep(2)
    actualMessage = @registrationFormPage.getMessage()
    expect(actualMessage).to eq(messageInfo)  
  end
  
  