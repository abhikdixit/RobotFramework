*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   http://www.stackoverflow.com/    Chrome
    maximize browser window
    Execute JavaScript    window.scrollTo(0, 1000)
    Sleep    3s
    Execute JavaScript    window.scrollTo(1000, 2000)
    Sleep    3s
    Execute JavaScript    window.scrollTo(2000, 3000)
    Sleep    3s
    Execute JavaScript    window.scrollTo(3000, 4000)
    Close Browser