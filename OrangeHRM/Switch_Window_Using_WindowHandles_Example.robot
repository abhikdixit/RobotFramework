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
Get the Window Handles and Switch to Window

    @{Win_list}     get window handles
    FOR   ${win_id}   IN     @{Win_list}
       select window   ${win_id}
       #Sleep    2s
       #Click Link       link=Admin
       Sleep    2s
       ${title}=       get title
       log to console      ${title}
       ${url}=     get location
       log to console      ${url}
    END
Close Application Browser
    Close Browser