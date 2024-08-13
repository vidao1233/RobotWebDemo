*** Settings ***
Documentation   Resource file for Login.robot script
Resource    ../Base.resource
Resource    ../PageObject/MakeAppointmentPage.resource

*** Keywords ***
Open appointment form
    Make appointment

Submit to make appointment
    Submit Book Appointment

User fill make appointment form
    [Arguments]     ${facility}     ${apply_readmission}    ${healthcare_program}   ${visit_date}   ${comment}
    Choose facility     ${facility}
    Choose apply for hospital readmission    ${apply_readmission}
    Choose healthcare program    ${healthcare_program}
    Enter visit date    ${visit_date}
    Enter comment    ${comment}

See visit date
    ${is_visible}=      Is visit date visible
    Should Be True    ${is_visible}     Fail: Visit date is not visible as expected; expected: Cannot submit appointment, observe: Submit appointment successfull.
    Log To Console    \nPass: See visit date ${is_visible}; expected: Cannot submit appointment, observe: Submit successfull.


Check appointment confirmation info
    [Arguments]     ${facility_key}     ${apply_readmission}    ${healthcare_program}   ${visit_date}   ${comment}
    ${facility_value}=      Get From Dictionary    ${facility}    ${facility_key}
    &{appointment_request}=     Create Dictionary
    ...                         facility=${facility_value}
    ...                         program=${healthcare_program}
    ...                         readmission=${apply_readmission}
    ...                         visit_date=${visit_date}
    ...                         comment=${comment}
    &{appointment_info}=        Get info appointment confirmation
    Should Be True      &{appointment_request}==&{appointment_info}     Fail: Appointment confirmation didn't match with appointment request; expected: &{appointment_request}, observe: &{appointment_info}
    Log To Console    \nPass: Appointment confirmation matched with appointment request; expected: &{appointment_request}, observe: &{appointment_info}


