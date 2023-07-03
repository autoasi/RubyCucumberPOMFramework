
class Assert
    
    def validateURL(driver, expectedURL)
        result = false
        if (driver.current_url().eql?(expectedURL))
            result = true
        end
        return result
    end

end