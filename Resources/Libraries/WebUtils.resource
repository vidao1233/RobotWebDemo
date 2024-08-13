*** Settings ***
Library     Zoomba.GUILibrary   run_on_failure=None    WITH NAME    GUILibrary
Library    Process

*** Variables ***


*** Keywords ***
Web Close Chrome Client
    [Documentation]    Close the Chrome client that was opened via the Web Open Chrome Client keyword
    [Arguments]    ${chrome_process_result}
    Terminate Process    ${chrome_process_result}    kill=true

Web Open Chrome Client
    [Documentation]    Open a chrome client that can be connect repeatedly via specified debug port
    [Arguments]    ${chromeExecPath}    ${chrome_debug_port}  ${chrome_test_profile_folder}
    ${result} =    Start Process    ${chromeExecPath}    --remote-debugging-port\=${chrome_debug_port}    --user-data-dir\=${chrome_test_profile_folder}    --incognito    --disable-popup-blocking
    Sleep    5s     # to wait for Chrome client to start
    RETURN    ${result}

Web Connect To Chrome Client
    [Documentation]    Connect to a Chrome client if it is open (using Web Open Chrome Client)
    [Arguments]    ${chrome_debug_port}
    ${ChromeOptions}=     Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()  sys,selenium.webdriver
    Evaluate    $ChromeOptions.add_experimental_option("""debuggerAddress""", """127.0.0.1:${chrome_debug_port}""")
    ${result} =     GUILibrary.Create WebDriver    Chrome    options=${ChromeOptions}
    RETURN    ${result}

