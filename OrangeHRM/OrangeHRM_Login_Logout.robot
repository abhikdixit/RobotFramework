*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    [Tags]    Smoke
    Open Browser	https://opensource-demo.orangehrmlive.com/	chrome
    Maximize Browser Window
    Input Text	xpath=//input[@id='txtUsername']	Admin
    Input Text	name=txtPassword	admin123
    #Click Button	xpath=//input[@id='btnLogin']
    Click Button	css=input[id='btnLogin']
    #Element Text Should Be	link=Dashboard	Dashboard
    Page Should Contain Link        Dashboard   timeout=5
    #Verify that user is on Dashboard page
    Element Text Should Be	link=Dashboard	Dashboard

Logout from OrangeHRM

    click element       id=welcome
    wait until element is visible       link=Logout     timeout=10
    #Sleep   5s
    click link      Logout
    page should contain link        Forgot your password?

Close browser at end
    Close Browser
