*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   http://www.stackoverflow.com/    Chrome
    Maximize Browser Window
    #Scroll Element Into View     xpath://a[normalize-space()='Start your free trial']
    Scroll Element Into View     link=Create a free Team
    Sleep   5s
    Click link      link=Create a free Team
    Sleep   5s
    Close Browser