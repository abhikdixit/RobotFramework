*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary


*** Test Cases ***
OpenBrowser-SetUP
    LaunchTest
Dropdown_Example
    Select From List By Value    id=carselect    honda
    Sleep       2s
    Select From List By Index    id=carselect    2
    Sleep       2s
    Select From List By Label    id=carselect    BMW
Checkbox_Example
    Sleep   2s
    Select Checkbox    id=bmwcheck
    Sleep   2s
    Unselect Checkbox    id=bmwcheck
    Sleep   2s

List Box_Example
    Select From List By Value    id=multiple-select-example    apple
    Sleep       2s
    Select From List By Index    id=multiple-select-example    2
    Sleep       2s

Verify Object Hide and Show
    Click Button        hide-textbox
    Page Should Not Contain     //input[@style='display: block;']
    Sleep       2s
    Click Button        show-textbox
    Page Should Contain Element     //input[@style='display: block;']
    Sleep       2s
Verify Enable and Disable
    Click Button        disabled-button
    Element Should Be Disabled      id=enabled-example-input
    Sleep       2s
    Click Button        enabled-button
    Element Should Be Enabled       id=enabled-example-input
    Sleep       2s
CloseBrowser-TearDown
    CloseTest

*** Keywords ***
LaunchTest
    Open Browser    https://courses.letskodeit.com/practice    chrome
    Maximize Browser Window
CloseTest
    Close Browser
