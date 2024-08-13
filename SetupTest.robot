*** Settings ***
Documentation   Tasks to setup test environment for web demo test project
Resource    Resources/TestKeywords/SetupTest.resource

*** Tasks ***
Open Chrome and go to webpage
    Open Chrome Client
    Connect to Chrome client
    Go to home page
