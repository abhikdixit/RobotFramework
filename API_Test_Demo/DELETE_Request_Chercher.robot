*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
*** Variables ***
${base_url}     https://chercher.tech/sample/api/product
${emp_id}       4809

*** Test Cases ***
Delete Employee Record
    create session  mysession   ${base_url}
    ${response}=    delete request     mysession        /delete?id=${emp_id}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}
