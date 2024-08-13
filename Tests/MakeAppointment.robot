*** Settings ***
Documentation   Make appointment in Cura Healthcare Service
Resource    ../Resources/Base.resource
Resource    ../Resources/TestKeywords/MakeAppointment.resource
Resource    ../Resources/TestKeywords/Login.resource

Suite Setup     Prepare for an appointment
Suite Teardown  Close Chrome Connection
Test Template   valid date should success

*** Test Cases ***                                                  facility        readmission     program     visit_date  comment
empty visit date success
    [Template]  empty visit date cannot make appointment
                                                                    Tokyo           No              None        ${EMPTY}    ${EMPTY}
visit date in the past fail
    [Template]  visit date in the past should fail
                                                                    Tokyo           No              None        01/08/2020  comment
Visit date as current date, Tokyo, check, medicare success          Tokyo           Yes             Medicare    01/09/2024  comment
Visit date as future date, Hongkong, unchecked, medicaid success    HongKong        No              Medicaid    01/09/2024  comment
Visit date as future date, Seoul, check, none success               Seoul           Yes             None        01/09/2024  comment

*** Keywords ***
empty visit date cannot make appointment
    [Arguments]                             ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Given Open appointment form
    When User fill make appointment form    ${facility}    ${apply_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Submit to make appointment
    Then See book appointment button    # why see appointment button?

visit date in the past should fail
    [Arguments]                             ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Given Open appointment form
    When User fill make appointment form    ${facility}    ${apply_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Submit to make appointment
    Then See visit date                 # why? better see appointment rejected
    [Teardown]  Go homepage

valid date should success
    [Arguments]                              ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}   ${comment}
    Given Open appointment form
    When User fill make appointment form    ${facility}    ${apply_readmission}    ${healthcare_program}    ${visit_date}    ${comment}
    Submit to make appointment
    Then Check appointment confirmation info    ${facility}    ${apply_readmission}    ${healthcare_program}    ${visit_date}    ${comment}









