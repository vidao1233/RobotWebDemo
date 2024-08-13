*** Settings ***
Documentation   Base resources for web demo test project.
...         Contain resources (keywords) shared by all files in the project
Resource    ../RunConfig.resource
Resource    Libraries/WebUtils.resource
Resource    PageObject/HomePage.resource
Resource    TestKeywords/SetupTest.resource
Resource    TestKeywords/CommonKeywords.resource

*** Variables ***


*** Keywords ***
Connect to Chrome client
    Web Connect To Chrome Client    ${chrome_debug_port}

Go to home page
    Go To           ${home_page_url}

Logout
    See logout option

Prepare for login
    Open Chrome Client
    Connect to Chrome client
    Go to home page

Prepare for an appointment
    Prepare for login
    Go to login page
    Login with valid username & password

Prepare before viewing history
    Prepare for login
    Go to login page









