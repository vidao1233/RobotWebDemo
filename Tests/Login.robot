*** Settings ***
Documentation       Login in Cura Healthcare Service
Resource    ../Resources/Base.resource
Resource    ../Resources/TestKeywords/Login.resource
Resource    ../Resources/TestData/LoginData.resource

Test Template       Login with invalid input
Suite Setup         Prepare for login
Suite Teardown      Close Chrome Connection

*** Test Cases ***                  username            password
Empty username                      ${EMPTY}            vidao
Empty password                      vidao               ${EMPTY}
Invalid username                    invalid             vidao
Valid username, invalid password    ${valid_username}   invalid
Valid username, valid password      [Template]          Login successful
                                    ${valid_username}   ${valid_password}

Get error when login failed multiple times
    [Template]  Login failed multiple times
                3                           #attempt times

*** Keywords ***
Login successful
    [Arguments]     ${username}     ${password}
    Given Go to login page
    When Login "${username}" & "${password}"
    Then See book appointment button
    [Teardown]  Logout

Login with invalid input
    [Arguments]     ${username}     ${password}
    Given Go to login page
    When Login "${username}" & "${password}"
    Then See error message login failed

Login failed multiple times
    [Arguments]     ${attempt}
    Given Go to login page
    When Attempt multiple "${attempt}" failed logins
    Then See error message login failed multiple times








