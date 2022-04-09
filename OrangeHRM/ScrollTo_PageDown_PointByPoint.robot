*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   http://www.stackoverflow.com/    Chrome
    Execute JavaScript    window.scrollTo(0, 1500)
    Sleep    3s
    Execute JavaScript    window.scrollTo(1500, 3000)
    Close Browser