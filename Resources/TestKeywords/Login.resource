*** Settings ***
Documentation   Resource file for Login.robot script
Resource    ../Base.resource
Resource    ../PageObject/LoginPage.resource
Resource    ../TestData/LoginData.resource


*** Keywords ***
Login "${username}" & "${password}"
    Login    ${username }   ${password}

Attempt multiple "${attempts}" failed logins
    FOR    ${i}    IN RANGE    ${attempts} + 1
        Login    ${valid_username}    invalid
    END

See book appointment button
    ${see_book_appointment} =  See book appointment
    Should Be True    ${see_book_appointment}     Fail: Failed to see book appointment button; expected: Login successful, observe: Login failed.
    Log To Console    \nPass: Login successful! See book appointment button; expected: Login successful, observe: Login successful.

See error message login failed
    ${error_message}=    Get Error Message
    Check True    "${error_message}==${error_message_login_failed}"    See login fail message    ${error_message_login_failed}    ${error_message}

See error message login failed multiple times
    ${error_message}=    Get Error Message
    Should Be True    "${error_message}"=="${error_message_login_multiple}"     Fail: See error message login failed multiple times; expected:${error_message_login_multiple}; observe: ${error_message}
    Log To Console    \nPass: See error message login failed multiple times; expected:${error_message_login_multiple}; observe: ${error_message}


