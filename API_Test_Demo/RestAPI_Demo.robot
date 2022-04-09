*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
*** Variables ***
${base_url}     https://reqres.in
${emp_id}       2

*** Test Cases ***
Get Employee Details
    create session  mysession   ${base_url}
    ${response}=    get on session     mysession   /api/users/${emp_id}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

    ${body}=        convert to string       ${response.content}
    should contain  ${body}     Janet

    ${contentTypeValue}=        get from dictionary     ${response.headers}     Content-Type
    ${dateValue}=        get from dictionary     ${response.headers}     Date
    should be equal     ${contentTypeValue}     application/json; charset=utf-8
    log to console      ${dateValue}