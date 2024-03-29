*** Settings ***
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     JSONLibrary
Library     ../Resources/Read_API_Request.py
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org

*** Test Cases ***
Create or Refresh Token
    ${response}=       Get Token
#Check token from Response Body
    ${access_token}=      get value from json  ${response}        $.access_token
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${access_token[0]}
    #Need to use Set Variable to set the value from Variable to another variable.
    ${access_token_final}=      Set Variable    ${access_token[0]}
    Set Global Variable   ${access_token_final}
Create an Address
    create session      mysession   ${base_url}
    log to console      ${access_token_final}
    ${headers}      create dictionary    Authorization=Bearer ${access_token_final}       Content-Type=application/json
    log to console      ${headers}
    ${req_body}=    get file    API_Test_Demo/Spreecom_API_New/TestData/CreateAddress.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /api/v2/storefront/account/addresses      json=${json_body}        headers=${headers}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    ${id}=      get value from json  ${response.json()}        $.data.id
    ${id_final}=      Set Variable    ${id[0]}
    Log to console   ${id_final}
    Set Global Variable   ${id_final}
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    Should be equal  ${fname[0]}  Robot

Update an Address
    create session      mysession   ${base_url}
    log to console      ${access_token_final}
    ${headers}      create dictionary    Authorization=Bearer ${access_token_final}       Content-Type=application/json
    log to console      ${headers}
    ${req_body}=    get file    API_Test_Demo/Spreecom_API_New/TestData/UpdateAddress.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    patch on session         mysession       api/v2/storefront/account/addresses/${id_final}      json=${json_body}        headers=${headers}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    Should be equal  ${fname[0]}  Updated

Delete an Address
    create session      mysession   ${base_url}
    log to console      ${access_token_final}
    ${headers}      create dictionary    Authorization=Bearer ${access_token_final}
    log to console      ${headers}

    ${response}=    delete on session         mysession       api/v2/storefront/account/addresses/${id_final}        headers=${headers}
    log to console      ${response.status_code}
    #${response_body}=      To Json     ${response.content}     pretty_print = True
    #Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       204