*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
*** Test Cases ***
OrangeHRM_Demo Page
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Maximize Browser Window
    Input Text    name=txtUsername    Admin
    Input Text    name=txtPassword    admin123
    Click Button    xpath=//input[@id='btnLogin']
    Element Text Should Be    link=Dashboard    Dashboard
    Sleep    2s
Switch to Browser- OrangeHRM Live page

    Open Browser    https://www.orangehrm.com/      chrome
    Sleep   2s
    Switch Browser      1
    ${title}=       get title
    log to console      ${title}
    Click Link      Admin
    Sleep   2s
    #Get the Current URL of visited page
    ${url}=     get location
    log to console      ${url}
    Sleep   2s
    Switch Browser      2
    ${title}=       get title
    log to console      ${title}
    #Click Button      Book a Free Demo
    Sleep   2s
    ${url}=     get location
    log to console      ${url}
    Sleep   2s
Close Application Browser
    Close All Browsers