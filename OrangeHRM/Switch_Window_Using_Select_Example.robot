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
Switch to Window

    switch window    title=OrangeHRM HR Software | Free HR Software | HRMS | HRIS
    Sleep   2s
    Click Button      Get a Free Demo
    Sleep   2s
    Element Text Should Be      xpath=//label[normalize-space()='First Name']       First Name
    switch window    title=OrangeHRM
    Sleep   5s
    Click Link      Admin
    Sleep   5s
Close Application Browser
    Close Browser