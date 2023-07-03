require 'selenium-webdriver' # Import Selenium WebDriver gem
require "yaml" # Import yaml gem
require 'test/unit' # Import test-unit gem
require './base/base.rb'
require './page/RegistrationFormPage.rb'
require './assertion/Assert.rb'

class RegistrationTest < TestBase  # Inherits from TestBase class

    def test_UserShouldBeAbleToRegister()
        registrationFormPage = RegistrationFormPage.new @@driver
        
        validation = Assert.new
        assert_true(validation.validateURL( @@driver,"https://mytestingthoughts.com/Sample/home.html") ,
                                                        "[Error ] Registration pagr URL is not maatching.")
        registrationFormPage.enterFirstName('Asi')
        registrationFormPage.enterLastName('Aharon')
        registrationFormPage.enterUsername('asiaharon')
        registrationFormPage.enterPassword('mypassword')
        registrationFormPage.enterEmail('asi@example.com')
        registrationFormPage.clickSubmitBtn()
        #sleep(2)
    end

    def test_UserShouldNotBeAbleToRegisterWithoutLastName()
        
    end    
end