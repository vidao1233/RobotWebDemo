*** Settings ***
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary
Resource    Locators/HistoryPageLocators.resource

*** Keywords ***
See no appointment notice
    ${notice}=      Get Text    ${locator_notice}
    RETURN      ${notice}

See appointment history info
    [Arguments]     ${visit_date_check}
    ${element_found}=   Run Keyword And Return Status    Wait Until Element Is Visible   ${locator_history_visit_date}    1s
    IF    $element_found!=False
        ${visit_date_history}=      Get Text    ${locator_history_visit_date}
        ${facility_history}=      Get Text    ${locator_history_facility}
        ${readmission_history}=      Get Text    ${locator_history_readmission}
        ${program_history}=      Get Text    ${locator_history_program}
        ${comment_history}=      Get Text    ${locator_history_comment}

        &{appointment_history_info}=    Create Dictionary
        ...                             facility=${facility_history}
        ...                             program=${program_history}
        ...                             readmission=${readmission_history}
        ...                             visit_date=${visit_date_history}
        ...                             comment=${comment_history}

        RETURN  &{appointment_history_info}
    ELSE
        RETURN    &{EMPTY}
    END

