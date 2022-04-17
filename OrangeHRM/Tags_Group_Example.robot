*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch SmartBear Login Page
    [Tags]    Sanity
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    Click Link      Logout
    Page Should Contain Button    id=ctl00_MainContent_login_button
    Close Browser

Click on JS Alert
    [Tags]    Smoke
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    chrome

    Click Element       xpath=//button[normalize-space()='Click for JS Alert']
    Sleep    2s
    Alert Should Be Present     I am a JS Alert     ACCEPT
    Sleep    2s
    Element Text Should Be      //p[@id='result']       You successfully clicked an alert
    Close Browser

Drag and Drop Functionality
    [Tags]    Regression
    Open Browser	https://jqueryui.com/resources/demos/droppable/default.html	chrome
    Maximize Browser Window
    Drag And Drop	id=draggable	id=droppable
    Sleep	5s
    Close Browser