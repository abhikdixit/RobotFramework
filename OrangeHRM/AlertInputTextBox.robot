*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Enter the Text in Alert Input Box
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    chrome
    Maximize Browser Window
    Click Button    xpath=//button[text()='Click for JS Prompt']
    Sleep   2s
    #Alert Should Be Present     I am a JS prompt
    Input Text Into Alert   Robot   ACCEPT
    Sleep   2s
    Element Text Should Be	id=result   You entered: Robot
    #Close Browser
    close browser