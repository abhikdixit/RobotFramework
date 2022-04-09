*** Settings ***
Library           SoapLibrary
Library           OperatingSystem

*** Test Cases ***
SoapUI Get Request
    Create Soap Client    http://dneonline.com/calculator.asmx?wsdl
    ${response}    Call SOAP Method With XML    ${CURDIR}/SampleRequest.xml
    ${text}    Get Data From XML By Tag    ${response}    AddResult
    Log    ${text}
    Save XML To File    ${response}    ${CURDIR}    ResponseResult