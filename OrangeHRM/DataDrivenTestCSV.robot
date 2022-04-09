*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot
Library     DataDriver      ../TestData/SwagLab_TestData.csv

Suite Setup     LaunchApplication
Suite Teardown  CloseApp
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails with Invalid Credentials
${username} ${password}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}
    Input Text	    ${txtbox_username}      ${username}
    Input Text	    ${txtbox_password}      ${password}
    Click Button    ${btn_login}
