*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
#${token}    m12UFeXV_gOKcDA3nNYY4rEanngX5dJoyB17BCTO5oE
*** Test Cases ***
Create or Refresh Token
    create session      mysession   ${base_url}
    ${header}=       create dictionary       Content-Type=application/json
    ${req_body}=    get file    API_Test_Demo/Spreecom_API_New/TestData/CreateToken.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /spree_oauth/token      json=${json_body}        headers=${header}
    #${response}=    post on session     mysession   /spree_oauth/token    data=${req_body}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    log to console      ${response_body}
    #log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${access_token}=      get value from json  ${response.json()}        $.access_token
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${access_token}
    ${access_token_final}=      Set Variable    ${access_token[0]}
    Log to console      ${access_token_final}
    set global variable     ${access_token_final}
Create an Address with all Valid info
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

#Check name from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    Should be equal  ${fname[0]}    Robot

    ${id}=      get value from json  ${response.json()}        $.data.id

    ${id_final}=      Set Variable    ${id[0]}
    Log to console   ${id_final}

