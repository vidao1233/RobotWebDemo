*** Settings ***
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary
Resource    Locators/HomePageLocators.resource
Resource    Locators/AppointmentConfirmationLocators.resource

*** Keywords ***
Make appointment
    Wait Until Page Contains Element    ${locator_button_make_appointment}
    Click Element    ${locator_button_make_appointment}

Open menu
    Wait Until Page Contains Element    ${locator_button_menu}
    Click Element    ${locator_button_menu}