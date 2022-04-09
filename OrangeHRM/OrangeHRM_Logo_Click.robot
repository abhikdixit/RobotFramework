*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Test Cases ***
OrangeHRM_Logo_Click
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Maximize Browser Window
    Input Text    name=txtUsername    Admin
    Input Text    name=txtPassword    admin123
    Click Button    xpath=//input[@id='btnLogin']
    Element Text Should Be    link=Dashboard    Dashboard
    Click Image    xpath=//img[@alt='OrangeHRM']
    Sleep    2s
    Close Browser