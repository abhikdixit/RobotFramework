*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     JSONLibrary
*** Variables ***
${base_url}     https://chercher.tech/sample/api/product

*** Test Cases ***
Get Employee Details
    create session  mysession   ${base_url}
    ${body}=        create dictionary   id=4724     name=Student  description=Robot-training   price=1001
    ${header}=      create dictionary   Content-Type=application/json
    ${response}=    put request     mysession        /update   data=${body}    headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}
    #Read the value after updating the request
    ${resp}=        get on session     mysession       /read
        #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

    ${body}=        convert to string       ${response.content}
    should contain  ${body}     Product was updated.
    should contain    ${resp.text}    Student