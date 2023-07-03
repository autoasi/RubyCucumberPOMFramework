@Registration
Feature: Registration form
         Customer can successfully register his details using the register form.
    
    Background: Add background step details

@Regression @PostiveTest @P1
Scenario: User can register his details using the register form succssfully
    Given user navigates to the registration form page
    When user enters "Mark" in first Name field
    And user enters "Smith" in Last Name field
    And user enters "marksmith" in username field
    #And user enters "mypassword" in password field
    And user enters "mark.smith@gmail.com" in Email field
    And user enters additional info in field
    """
    Line 1
    Line 2
    Line 3
    """
    And user clicks on submit button
    Then user should see a the message "Success Success!." in the registration form

@Regression @PostiveTest
Scenario Outline: User can register his details using the register form succssfully
    Given user navigates to the registration form page
    When user enters "<first_name>" in first Name field
    And user enters "<last_name>" in Last Name field
    And user enters "<username>" in username field
    And user enters "<password>" in password field
    And user enters "<email>" in Email field
    And user clicks on submit button
    Then user should see a the message "<message>" in the registration form

    Examples:
        | first_name | last_name | username | password    | email               | message           |
        | Tom        | Ford      | tomford  | password123 | tom.ford@gmail.com  | Success Success!. |
        | Jonathan   | Hart      | johart   | password456 | jo.hart@hotmail.com | Success Success!. |

@NegativTest
Scenario: User cannot register wihout providing all mandatory fields


@Smoke
Scenario: User can register his details only once
