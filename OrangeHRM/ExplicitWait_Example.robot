*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    [Tags]    Smoke
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php     firefox
    Maximize Browser Window
    Input Text	name=txtUsername	Admin
    Input Text	name=txtPassword	admin123
    Click Button    xpath=//input[@id='btnLogin']
    Wait Untill Element Is Visible      link=Dashboard      timeout=10s     error=Dashboard not visible
    Element Text Should Be	link=Dashboard	Dashboard
    Close Browser