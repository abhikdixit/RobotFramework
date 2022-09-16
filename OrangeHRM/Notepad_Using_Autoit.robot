*** Settings ***
Documentation    Suite description
Library     AutoItLibrary
*** Test Cases ***
Notepad function
    run     notepad.exe
    Sleep   2s
    Send    Hello to Robotframework
    Sleep   2s