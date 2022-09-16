*** Settings ***
Documentation    Suite description
Library           AutoItLibrary
Library           SikuliLibrary
*** Test Cases ***
Calc_UsingSikuli
    Run    calc.exe
    Win Wait Active     Calculator
    Sleep       2s
    SikuliLibrary.Click     D://Robot Framework//SikuliObjects//7.PNG
    Sleep       2s
    SikuliLibrary.Click     D://Robot Framework//SikuliObjects//Plus.PNG
    Sleep       2s
    SikuliLibrary.Click     D://Robot Framework//SikuliObjects//7.PNG
    Sleep       2s
    SikuliLibrary.Click     D://Robot Framework/SikuliObjects//Equall.PNG
    Sleep       2s
    Close Application       Calculator