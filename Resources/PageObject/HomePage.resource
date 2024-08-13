*** Settings ***
Resource    Locators/HomePageLocators.resource
Resource    Locators/AppointmentConfirmationLocators.resource
Resource    ../Libraries/Utilities.resource
Resource    CommonPageOperation.resource
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary

*** Keywords ***
Go to login page
    Open menu
    Wait Until Page Contains Element    ${locator_button_menu_login}
    Click Element    ${locator_button_menu_login}

Go to history page from home
    Open menu
    Wait Until Page Contains Element    ${locator_button_menu_history}
    Click Element    ${locator_button_menu_history}

Go homepage
    ${count_button} =   Count element    ${locator_button_go_homepage}
    IF    ${count_button} >0
        Page Should Contain Element    ${locator_button_go_homepage}
        Click Element    ${locator_button_go_homepage}
    ELSE
    Open menu
    Page Should Contain Element    ${locator_button_menu_home}
    Click Element    ${locator_button_menu_home}
    END

See logout option
    Open menu
    Wait Until Page Contains Element    ${locator_button_menu_logout}
    Click Element    ${locator_button_menu_logout}






