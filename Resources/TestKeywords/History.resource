*** Settings ***
Resource    ../PageObject/HistoryPage.resource
Resource    ../TestData/HistoryData.resource
Resource    ../TestData/MakeAppointmentData.resource
Resource    ../PageObject/HomePage.resource
Library    Collections

*** Keywords ***
Go to history page
    Go to history page from home

See no appointment booked
    ${no_appointment_notice}=       See no appointment notice
    Check True    "${no_appointment_notice}"=="${notice}"    History is empty    ${notice}    ${no_appointment_notice}

See appointment booked
    [Arguments]     ${facility_key}     ${apply_readmission}    ${healthcare_program}   ${visit_date}   ${comment}
    &{appointment_history_info}=    See appointment history info    ${visit_date}
    ${facility_value}=      Get From Dictionary     ${facility}     ${facility_key}
    &{appointment_request}=     Create Dictionary
    ...                         facility=${facility_value}
    ...                         program=${healthcare_program}
    ...                         readmission=${apply_readmission}
    ...                         visit_date=${visit_date}
    ...                         comment=${comment}

    Should Be True    &{appointment_history_info}==&{appointment_request}     Fail: Cannot see appointment at ${visit_date},expected: &{appointment_request}, observe: &{appointment_history_info}.
    Log To Console    \nPass, History appointment matched with appointment request; expected: &{appointment_request}, observe: &{appointment_history_info}.
