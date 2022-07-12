*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   http://www.stackoverflow.com/    Chrome
    #This will take to bottom of the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    #Input Text    name=q    robot framework
    #Sleep    3s
    Click Link      About
    Sleep    3s
    Go Back
    #Go Forward
    #Go Refresh
    Sleep    3s
    #This will take up to the page
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    Sleep    3s
    click element       xpath=//button[contains(text(),'Accept all cookies')]
    click link      search content
    Sleep    3s
    Close All Browsers