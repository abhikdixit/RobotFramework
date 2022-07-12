*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    [Tags]    Smoke
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php     chrome
    Maximize Browser Window
    Input Text	name=txtUsername	Admin
    Input Text	name=txtPassword	admin123
    Click Button    xpath=//input[@id='btnLogin']
    Sleep   2s
    #Verify that user is on Dashboard page
    Element Text Should Be	link=Dashboard	Dashboard
    Close Browser
