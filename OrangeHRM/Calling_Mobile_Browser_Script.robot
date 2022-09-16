*** Settings ***
Library    ../Resources/Mobile_Browser_View.py
Library     SeleniumLibrary
*** Test Cases ***
Example to demonstrate Python library usage
    ${name}=        Mobile Browser
    open browser    https://opensource-demo.orangehrmlive.com/
