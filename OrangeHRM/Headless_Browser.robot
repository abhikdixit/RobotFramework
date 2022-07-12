*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page

    Open Browser    https://opensource-demo.orangehrmlive.com/  headlessfirefox
    Maximize Browser Window
    Input Text	name=txtUsername	Admin
    Input Text	name=txtPassword	admin123
    Click Button    xpath=//input[@id='btnLogin']
    Element Text Should Be	link=Dashboard	Dashboard
    Close Browser
