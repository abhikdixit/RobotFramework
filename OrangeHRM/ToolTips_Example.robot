*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     Collections
*** Test Cases ***
Tool tips verification
    [Tags]    DEBUG
    Open Browser	https://jqueryui.com/tooltip/	ff
    Maximize Browser Window
    Sleep	2s
    select frame        xpath=//iframe[@class='demo-frame']
    wait until element is visible       xpath=//input[@id='age']      timeout=10s
    mouse over      xpath=//input[@id='age']
    ${title}=       get element attribute       xpath=//input[@id='age']      title
    Log to Console      ${title}

Close browser at end
    close all browsers