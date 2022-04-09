*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot
Resource    ../TestData/ConfigData.robot

*** Test Cases ***
Launch OrangeHRM URL
    LaunchApplication
Verify Login Functionality of OrangeHRM Application

    Input Text	${txtbox_username}	Admin
    Input Text	${txtbox_password}	admin123
    Click Button    ${btn_login}
    Sleep   2s
    Element Text Should Be  ${lnk_dashboard}     Dashboard
Close OrangeHRM Application
    CloseApp