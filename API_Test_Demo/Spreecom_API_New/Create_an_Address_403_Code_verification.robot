*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
${token}    BTUd-1usa10uriQN61IvuRmexW1LAAGW1tRemp518-d
*** Test Cases ***
Create an Address
    create session      mysession   ${base_url}
    log to console      ${token}
    ${headers}      create dictionary    Authorization=Bearer ${token}       Content-Type=application/json
    log to console      ${headers}
    ${req_body}=    get file    API_Test_Demo/Spreecom_API_New/TestData/CreateAddress.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /api/v2/storefront/account/addresses      json=${json_body}        headers=${headers}
    #${passed} =   Run Keyword And Return Status   Should be Equal   1   2
    #Run Keyword And Return Status       ${response}
    ${response}=    Run keyword and continue on failure       post on session         mysession       /api/v2/storefront/account/addresses      json=${json_body}        headers=${headers}
    Log to console      ${response}
    #run keyword and continue on failure     ${response}
    #log to console      ${response.status_code}
    #${response_body}=      To Json     ${response.content}     pretty_print = True
    #Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       403
    log to console      ${status_code}

##Check token from Response Body
#    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
#    #extract the contents of the string out of the query results , to remove unicode
#    # Need to use [0]
#    Log to console      ${fname[0]}
#    Should be equal  ${fname[0]}  Robot
#
#    ${id}=      get value from json  ${response.json()}        $.data.id
#
#    ${id_final}=      Set Variable    ${id[0]}
#    Log to console   ${id_final}