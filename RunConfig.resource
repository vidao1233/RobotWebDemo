*** Settings ***
Documentation   Run configuration for web demo test project
...             Contain variables to configure test run environment

*** Variables ***
${home_page_url} =   https://katalon-demo-cura.herokuapp.com/
${chrome_path} =    C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe
${chrome_debug_port} =    9222
${chrome_test_profile_folder} =    C:\\Users\\vttdao\\TmpProfile