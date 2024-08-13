*** Settings ***
Resource    ../PageObject/LoginPage.resource
Resource    ../TestData/LoginData.resource

*** Keywords ***
Login with valid username & password
    Login    ${valid_username}    ${valid_password}