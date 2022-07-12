*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch WebOrder Login Page
    [Tags]    Smoke
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Set Selenium Implicit wait  20s
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button

    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    Close Browser