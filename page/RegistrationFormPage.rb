
class RegistrationFormPage

    @driver # Instance variable

    def initialize(driver)
        @driver = driver
    end

    def enterFirstName(firstName)
        @driver.find_element(:name, "first_name").send_keys(firstName)
    end

    def enterLastName(lastName)
        @driver.find_element(:name, "last_name").send_keys(lastName)
    end

    def enterUsername(username)
        @driver.find_element(:name, "user_name").send_keys(username)
    end

    def enterPassword(password)
        @driver.find_element(:name, "user_password").send_keys(password)
    end 

    def enterEmail(email)
        @driver.find_element(:name, "email").send_keys(email)
    end

    def enterAdditionalInfo(additionalInfo)
        @driver.find_element(:xpath, "//*[@id='exampleFormControlTextarea1']").send_keys(additionalInfo)
    end

    def clickSubmitBtn()
        @driver.find_element(:xpath, "//*[@type='submit']").click()
    end

    def getMessage()
        @driver.find_element(:xpath, "//*[@id='success_message']").text
    end

end 