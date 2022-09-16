*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Test Cases ***
OrangeHRM_Logo_Click
    [tags]      Test
    Open Browser	https://opensource-demo.orangehrmlive.com/web/index.php/auth/login	ff
    Maximize Browser Window
    Sleep	2s
    Input Text	    name=username	    Admin
    Sleep	2s
    Input Text	    name=password	    admin123
    Sleep	2s
    #Click Button	xpath=//input[@id='btnLogin']
    Click Button	css=button[type='submit']
    Sleep	2s
    Click Image    xpath=//img[@alt='client brand banner']
    Sleep   2s
    Close Browser

