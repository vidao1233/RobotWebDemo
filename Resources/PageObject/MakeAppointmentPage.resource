*** Settings ***
Resource    Locators/MakeAppointmentPageLocators.resource
Resource    Locators/AppointmentConfirmationLocators.resource
Resource    ../Libraries/WebUtils.resource
Resource    ../TestData/MakeAppointmentData.resource
Resource    ../Base.resource
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary
Library    XML
Library    Collections

*** Keywords ***
Choose Facility
    [Arguments]    ${facility_name}
    ${facility_value}=    Get From Dictionary    ${facility}    ${facility_name}
    Wait Until Page Contains Element    ${locator_select_facility}
    Select From List By Value    ${locator_select_facility}    ${facility_value}

Choose apply for hospital readmission
    [Arguments]     ${apply_for_hospital_readmission}
    Wait Until Page Contains Element    ${locator_checkbox_readmission}
    IF  "${apply_for_hospital_readmission}" == "Yes"
        Select Checkbox    ${locator_checkbox_readmission}
    ELSE
        Unselect Checkbox    ${locator_checkbox_readmission}
    END

Choose Healthcare Program
    [Arguments]    ${program_value}
    Wait Until Page Contains Element    ${locator_radio_program}
    Select Radio Button    programs    ${program_value}

Enter visit date
    [Arguments]     ${visit_date}
    Wait Until Page Contains Element    ${locator_input_visit_date}
    Input Text    ${locator_input_visit_date}    ${visit_date}

Enter comment
    [Arguments]     ${comment}
    Wait Until Page Contains Element    ${locator_input_comment}
    Input Text    ${locator_input_comment}    ${comment}

Submit Book Appointment
    Scroll Element Into View    ${locator_button_book_appointment}
    Click Button    ${locator_button_book_appointment}

Get error message invalid visit date
    Wait Until Page Contains Element    ${locator_error_message_invalid_visit_date}
    ${error_message} =      Get Text    ${locator_error_message_invalid_visit_date}
    RETURN  ${error_message}

Is visit date visible
    ${is_visible}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_input_visit_date}    2s
    RETURN  ${is_visible}

Get info appointment confirmation
    ${facility_info}=       Get Text    ${locator_info_facility}
    ${program_info}=        Get Text    ${locator_info_healthcare_program}
    ${readmission_info}=    Get Text    ${locator_info_apply_readmission}
    ${visit_date_info}=     Get Text    ${locator_info_visit_date}
    ${comment_info}=        Get Text    ${locator_info_comment}

    &{appointment_info}=    Create Dictionary
    ...                     facility=${facility_info}
    ...                     program=${program_info}
    ...                     readmission=${readmission_info}
    ...                     visit_date=${visit_date_info}
    ...                     comment=${comment_info}

    RETURN      &{appointment_info}



