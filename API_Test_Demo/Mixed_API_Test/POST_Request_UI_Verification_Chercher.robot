*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     JSONLibrary
Library     SeleniumLibrary
*** Variables ***
${base_url}     https://chercher.tech/sample/api/product

*** Test Cases ***
Get Employee Details
    create session  mysession   ${base_url}
    ${body}=        create dictionary   name=Master1  description=Robottraining   price=1001
    ${header}=      create dictionary   Content-Type=application/json
    ${response}=    post request     mysession        /create   data=${body}    headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}
    #Read the value after posting the request
    ${resp}=        get on session     mysession       /read
        #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       201
    log to console      ${status_code}

    ${body}=        convert to string       ${response.content}
    should contain  ${body}     Product was created with UI.
    should contain    ${resp.text}    Master1

*** Test Cases ***
Chercher Tech UI Verification
    Open Browser    https://chercher.tech/sample/api-ui    chrome
    Maximize Browser Window
    Input Text    xpath=//input[@placeholder='Search product...']    Master1
    Element Text Should Be    xpath=//td[normalize-space()='Master1']    Master1
    Sleep    2s
    Close Browser

# Verify the result using below link
# https://chercher.tech/sample/api-ui
