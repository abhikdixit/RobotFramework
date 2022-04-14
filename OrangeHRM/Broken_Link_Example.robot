*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String
Test Setup    Open Browser    ${BASE_URL}       Chrome
Test Teardown    Close Browser


*** Variables ***
${BASE_URL}    https://www.google.co.in/

*** Test Cases ***
Broken links test
    @{element_list}=        Get WebElements     xpath=//a[@href]
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in @{element_list}]
    Log    ${href_list}

    Create Session    testing    ${BASE_URL}
    FOR    ${element_href}    IN    @{href_list}
        ${uri}=    Remove String    ${element_href}    ${BASE_URL}
        ${contains_base_url}=    Evaluate     "${BASE_URL}" in "${element_href}"
        ${response}=    Run Keyword If    ${contains_base_url}    GET On Session    testing    ${uri}
        Run Keyword If    ${contains_base_url}    Should Be Equal As Strings     ${response.status_code}    200
    END