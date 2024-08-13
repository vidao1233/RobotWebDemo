*** Settings ***
Documentation   Check history of booked appoitments
Resource        ../Resources/Base.resource
Resource        ../Resources/TestKeywords/MakeAppointment.resource
Resource        ../Resources/TestKeywords/History.resource

Suite Setup     Prepare before viewing history
Suite Teardown  Close Chrome Connection

Test Teardown   Logout

*** Test Cases ***                                                  facility    readmission     healthcare      visit_date      comment
See no appointment in history page when no book
    See no appointment when no book

See booked in history page after making appointment
    See booked after making appointment                             HongKong     Yes             Medicare        20/08/2024      comment

See booked appointment after logout then relogin
    See booked appointment after logout then relogin               HongKong     Yes             Medicare        20/08/2024      comment


*** Keywords ***
See no appointment when no book
    Given Login with valid username & password
    When Go to history page
    Then See no appointment booked

See booked after making appointment
    [Arguments]                         ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Given Open appointment form
    Login with valid username & password
    User fill make appointment form     ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Submit to make appointment
    When Go to history page
    Then See appointment booked         ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}

See booked appointment after logout then relogin
    [Arguments]                         ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Given Open appointment form
    Login with valid username & password
    User fill make appointment form     ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
    Submit to make appointment
    When Logout
    Go to login page
    Login with valid username & password
    Go to history page
    Then See appointment booked         ${facility}    ${apply_readmission}    ${healthcare_program}   ${visit_date}    ${comment}
