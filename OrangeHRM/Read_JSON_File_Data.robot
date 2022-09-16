*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     OperatingSystem

*** Test Cases ***
Example of how to load JSON
# read the raw data
    #${json}=    Get file    C:/Users/adixit/PycharmProjects/RobotFramework/TestData/login.json
    ${json}=    Get file    TestData/Login.json
# convert the data to a python object
    ${object}=  Evaluate    json.loads('''${json}''')   json
    Log to console      ${object}
# Read the data from JSON and pass to application
    Open Browser    ${object["url"]}  ff
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    ${object["uname"]}
    Input Text    id=ctl00_MainContent_password    ${object["pass"]}
    Click Button  id=ctl00_MainContent_login_button
    Sleep   5s
    Page Should Contain Button    id=ctl00_MainContent_btnDelete

    Close Browser