*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary


*** Test Cases ***
OpenBrowser-SetUP
    LaunchTest
Dropdown_Example
    Select From List By Value    id=testingDropdown    Manual
    Select From List By Index    id=testingDropdown    3
    Select From List By Label    id=testingDropdown    Performance Testing
Checkbox_Example
    Sleep   2s
    Select Checkbox    xpath=//input[@value='Automation']
    Unselect Checkbox    xpath=//input[@value='Automation']

RadioButton_Example
    Sleep   2s
    Select Radio Button    gender    male
Handle_Alert_Example
    Double Click Element    id=dblClkBtn
    Sleep    2s
    Alert Should Be Present     hi, JavaTpoint Testing
    #Handle Alert    action=ACCEPT
Dropdown_Example
    Sleep   2s
    Select From List By Value    id=testingDropdown    Manual
    Select From List By Index    id=testingDropdown    3
    Select From List By Label    id=testingDropdown    Performance Testing
CloseBrowser-TearDown
    CloseTest

*** Keywords ***
LaunchTest
    Open Browser    https://www.testandquiz.com/selenium/testing.html    chrome
    Maximize Browser Window
CloseTest
    Close Browser
LoginToOrangeHRM
