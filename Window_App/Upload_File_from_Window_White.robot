*** Variables ***
${TEST APPLICATION}	    notepad.exe
*** Settings ***
Library	    WhiteLibrary
Library     SeleniumLibrary
*** Test Cases ***
Notepad Example
    open browser        https://the-internet.herokuapp.com/upload           chrome
    maximize browser window
    Sleep       5s
    SeleniumLibrary.Click Button       id:file-upload
    Sleep       8s
    Press Keys      D:\\Robot Framework\\Myfile.txt
   WhiteLibrary.Click Button        text:Open
    Sleep       2s
    close browser