*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot
Library     DataDriver      ../TestData/OrangeHRMTestData.xls  sheet_name=Login

Suite Setup     LaunchApplication
Suite Teardown  CloseApp
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails with Invalid Credentials
${username} ${password} ${error_msg}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}         ${error_msg}
    Input Text	    ${txtbox_username}      ${username}
    Input Text	    ${txtbox_password}      ${password}
    Click Button    ${btn_login}
    Sleep  2s
    Element Should Contain      ${txt_error}  ${error_msg}