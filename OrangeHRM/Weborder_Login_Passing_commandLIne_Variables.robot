*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/
${browser}      chrome

*** Test Cases ***
Launch OrangeHRM Login Page

    Open Browser    ${url}  ${browser}
    Maximize Browser Window
        Input Text    id=ctl00_MainContent_username    Tester
        Input Text    id=ctl00_MainContent_password    test
        Click Button  id=ctl00_MainContent_login_button
        Sleep   5s
        Page Should Contain Button    id=ctl00_MainContent_btnDelete
    Close Browser
