*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TestandQuiz Edit,Radio and Checkbox Functionality
    Open Browser        https://www.testandquiz.com/selenium/testing.html       chrome
TextBox Functionality
    Input Text      name=firstName      Dixit
ClickButton Functionality
    Click Button    Submit
    Click Element   id=female
    Click Element   xpath=//input[@class='Automation']
Close Browser
    Close Browser
