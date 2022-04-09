*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../TestData/ConfigData.robot

*** Keywords ***
LaunchApplication
    Open Browser        ${url}      ${browser}
    Maximize Browser Window
    Sleep   2s
CloseApp
    Close Browser

LoginToOrangeHRM
