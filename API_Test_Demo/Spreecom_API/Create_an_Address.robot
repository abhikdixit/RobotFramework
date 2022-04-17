*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
${token}    "WDlzEiwkGnL6fgmXouoiZgklyOTzxJDn8baa-Ywq_B4"
*** Test Cases ***
Create an Address
    create session      mysession   ${base_url}
    log to console      ${token}
    ${headers}      create dictionary    Authorization=Bearer ${token}       Content-Type=application/json
    log to console      ${headers}
    #encode() method
    ${encode_headers}=      Encode String To Bytes      ${headers}      ASCII
#    #decode() method
    ${final_headers}=       Decode Bytes To String      ${encode_headers}       ASCII
    log to console      ${final_headers}
    ${req_body}=    get file    API_Test_Demo/TestData/CreateAddress.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /api/v2/storefront/account/addresses      json=${json_body}        headers=${headers}
    #${response}=    post on session     mysession   /spree_oauth/token    data=${req_body}
    log to console      ${response.status_code}
    log to console      ${response.content}
    #log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    Should be equal  ${fname[0]}  Robot