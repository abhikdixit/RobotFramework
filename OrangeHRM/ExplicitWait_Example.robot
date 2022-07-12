*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch Weborder Login Page
    [Tags]    Smoke
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button

    wait until element is visible      id=ctl00_MainContent_btnDelete      timeout=60s     error=Delete not visible
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    Close Browser
