*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Double_Click_Example
    Open Browser    https://www.testandquiz.com/selenium/testing.html    chrome
    Maximize Browser Window
    Double Click Element    id=dblClkBtn

Handle_Alert_Example
    Sleep    2s
    Alert Should Be Present     hi, JavaTpoint Testing
    #Handle Alert    action=
Dropdown_ExampleACCEPT

    Select From List By Value    id=testingDropdown    Manual
    Select From List By Index    id=testingDropdown    3
    Select From List By Label    id=testingDropdown    Performance Testing

Checkbox_Example
    Select Checkbox    xpath=//input[@value='Automation']
    Sleep       2s
    Unselect Checkbox    xpath=//input[@value='Automation']
    Sleep       2s
RadioButton_Example

    Select Radio Button    gender    male
    Close Browser
