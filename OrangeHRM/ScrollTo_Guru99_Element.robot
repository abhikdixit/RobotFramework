*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   http://demo.guru99.com/test/guru99home/scrolling.html    Chrome
    Maximize Browser Window
    Scroll Element Into View     link=VBScript
    Sleep   3s
    Click Link      VBScript
    Sleep   3s
    Close Browser