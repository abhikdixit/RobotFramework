*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    #Capture particular Element Screenshot
    Capture Element Screenshot      id=ctl00_MainContent_btnDelete      C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Scnreenshot\\Delete.png
    Click Link      Logout
    Capture Page Screenshot     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Scnreenshot\\LoginPage.png
    Page Should Contain Button    id=ctl00_MainContent_login_button

    Sleep   2s
    Close Browser
