*** Settings ***
Documentation  Switching between Browser Windows in Robot Framework
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
#Switch between Browser windows using 'Browser Title' and verify the text
#    [documentation]  This test case verifies that the user is able to switch between browser
#    ...  windows using browser title and verify the text.
#    [tags]  Smoke
#    Open Browser  https://the-internet.herokuapp.com/windows  Chrome
#    Wait Until Element Is Visible  tag:h3  timeout=5
#    Click Element  css:[href="/windows/new"]
#    Select Window       title:The Internet
#    Element Text Should Be  tag:h3  Opening a new window  timeout=5
#    Select Window       title:New Window
#    Element Text Should Be  tag:h3  New Window  timeout=5
#    Close Browser

Switch between Browser windows using 'Get Window Handles' and verify the text
    [documentation]  This test case verifies that the user is able to switch between browser
    ...  windows using window handles and verify the text.
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/windows  ff
    Sleep       5s
    Wait Until Element Is Visible   tag:h3
    Click Element  css:[href="/windows/new"]
    @{handles}=  Get Window Handles
    switch browser       ${handles}[0]
    Element Text Should Be  tag:h3  Opening a new window  timeout=5
    switch browser       ${handles}[1]
    Element Text Should Be  tag:h3  New Window  timeout=5
    Close Browser