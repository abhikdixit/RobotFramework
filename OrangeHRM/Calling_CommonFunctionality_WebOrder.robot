*** Settings ***
Documentation    Suite description
#Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot

Suite Setup     LaunchApplication
Suite Teardown      CloseApp

*** Test Cases ***
Calling UserDefined Keyword
    Enter Username Web      Tester
    Enter Password Web     test
    Click On Login Button Web

