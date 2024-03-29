*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot
Library     DataDriver      ../TestData/OrangeHRM_LoginData.csv

Suite Setup     LaunchApplication
Suite Teardown  CloseApp
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails with Invalid Credentials using ${username} ${password} ${error_msg}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}         ${error_msg}
    Input Text	    ${txtbox_username}      ${username}
    Input Text	    ${txtbox_password}      ${password}
    Click Button    ${btn_login}
    Sleep  2s
    #Verify that, If user has logged in them Dashboard , if not then Login page
    ${count}=  Get Element Count  xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']  # Checking whether user on Login page or not
    Run Keyword If  ${count} > 0  Element Should Contain      ${txt_error}    ${error_msg}  # If the element is not present we will get the value of count as 0
    ...  ELSE  Element Should Contain      ${lnk_dashboard}    ${error_msg}