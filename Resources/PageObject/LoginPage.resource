*** Settings ***
Resource    Locators/LoginPageLocators.resource
Resource    Locators/MakeAppointmentPageLocators.resource
Resource    ../Libraries/Utilities.resource
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary
Library    XML

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    ${locator_input_username}    ${username}
    Input Text    ${locator_input_password}    ${password}
    Click Element    ${locator_button_login}

See book appointment
    ${see_book_button} =      Count element     ${locator_button_book_appointment}
    RETURN  ${see_book_button}

Get Error Message
    ${error_message}=    Get Text    ${locator_message_error}
    RETURN    ${error_message}
