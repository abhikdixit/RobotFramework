*** Settings ***
Documentation    Suite description
Library     AutoItLibrary
*** Test Cases ***
Notepad function
    Run     C:\\Program Files\\Notepad++\\notepad++.exe
    #WinWaitActive   new 1 — Notepad++
    Sleep   5s
    Send    Hello to Robotframework
    #Control Set Text	new 1 — Notepad++		Edit1	Hello Robot