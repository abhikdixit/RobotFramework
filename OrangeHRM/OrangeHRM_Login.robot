*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM and Login with Valid Credentials
    [Tags]    Smoke
    Open Browser	https://opensource-demo.orangehrmlive.com/web/index.php/auth/login	chrome
    Maximize Browser Window
    Sleep	2s
    Input Text	    name=username	    Admin
    Sleep	2s
    Input Text	    name=password	    admin123
    Sleep	2s
    #Click Button	xpath=//input[@id='btnLogin']
    Click Button	css=button[type='submit']
    Sleep	2s

Verify that user has landed to Dashboard page
    #Verify that user is on Dashboard page
    element text should be  xpath=//span[normalize-space()='Dashboard']     Dashboard
    Sleep	2s
Close the browser at end
    close all browsers
