*** Settings ***
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary

*** Keywords ***
Count element
    [Arguments]     ${locator}
    ${button_book_appointment_count} =  GUILibrary.Get Element Count    ${locator}
    ${see_book_button} =      Evaluate    ${button_book_appointment_count}>0
    RETURN  ${see_book_button}

Check True
    [Arguments]   ${expression}  ${message}  ${expected_result}   ${observed_result}
    Should Be True    ${expression}     Fail, ${message}; expect: ${expected_result}; observe: ${observed_result}
    Log  Pass, ${message}; expect: ${expected_result}; observe: ${observed_result}
    Log To Console    \nPass, ${message}; expect: ${expected_result}; observe: ${observed_result}