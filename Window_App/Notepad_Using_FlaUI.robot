*** Variables ***
${TEST APPLICATION}	    notepad.exe
*** Settings ***
Library	        FlaUILibrary
*** Test Cases ***
Notepad Example
    Launch Application	    ${TEST APPLICATION}
    #Attach Application By Name      /Window[@Name='Untitled - Notepad']
    Sleep       2s
    #Attach Window	Untitled - Notepad
    Set Text To Textbox      /Window/Document       Welcome Abhi
    Sleep       2s
    ${act_text}=        Get text from textbox   /Window/Document        text:Text Editor
    Should be Equal     ${act_text}     Welcome Abhi
    Log to console      ${act_text}
    #Click       /Window/MenuBar/MenuItem[1]
    Sleep       2s
    Click      /Window[@Name='Untitled - Notepad']/MenuBar/MenuItem[@Name='File']
    Click       /Window[@Name='Untitled - Notepad']/MenuBar/MenuItem[@Name='File']/Menu/MenuItem[4]

    Sleep       2s
    Set Text To Textbox      /Window/Window/Text        D:\\Robot Framework\\Myfile.txt
    Click        /Window/Window/Button[1]
    Sleep       2s
    Click        /Window/Window/Window/Button[1]
    Sleep       2s

Close Application at end
    Close Application   /Window[@Name='Untitled - Notepad']