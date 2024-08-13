*** Settings ***
Documentation   Resource file for SetupTest.robot script
Resource    ../Base.resource

*** Variables ***


*** Keywords ***
Open Chrome client
    ${result} =    Web Open Chrome Client    ${chrome_path}    ${chrome_debug_port}    ${chrome_test_profile_folder}
    Set Suite Variable    ${chrome_process}    ${result}
    Should Be True    ${result}     Cannot start Chrome test client; path:${chrome_path}; port:${chrome_debug_port}; profileFolder:${chrome_test_profile_folder}

Close Chrome Connection
    Web Close Chrome Client    ${chrome_process}

