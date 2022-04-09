*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    Click Link      Logout
    Page Should Contain Button    id=ctl00_MainContent_login_button
    Close Browser