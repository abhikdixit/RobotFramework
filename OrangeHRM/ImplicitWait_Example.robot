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
    Sleep   5s
    #Set Selenium Implicit wait  20s
    Element Text Should Be	link=Dashboard	Dashboard
    Close Browser
