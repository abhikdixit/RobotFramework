*** Settings ***
Documentation    Suite description
Library           AutoItLibrary
Library           SikuliLibrary
*** Test Cases ***
LaunchCalc
    Run    calc.exe
    Win Wait Active    Calculator
    Sleep    2s
    Send    7
    #Sleep    2s
    Send    +
    Sleep    2s
    Send    5
    #Sleep    2s
    Send    =
    Sleep    2s
    Win Close    Calculator