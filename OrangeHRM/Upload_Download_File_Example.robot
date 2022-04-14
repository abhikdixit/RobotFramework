*** Settings ***
Documentation  File Upload Download in Robot Framework
Library  SeleniumLibrary
Library   OperatingSystem

*** Variables ***

*** Test Cases ***
Verify File Upload
    [documentation]  This test case verifies that a user can successfully upload a file
    [tags]  Regression
    Open Browser  https://the-internet.herokuapp.com/upload     Chrome
    Wait Until Element Is Visible  id:file-submit  timeout=5
    Choose File  id:file-upload     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\TestData\\Image0019.jpg
    Click Element  id:file-submit
    Sleep  5s
    Element Text Should Be  tag:h3  File Uploaded!  timeout=5
    Element Text Should Be  id:uploaded-files  Image0019.jpg  timeout=5
    Close Browser

Verify File Download
    [documentation]  This test case verifies that a user can successfully download a file
    [tags]  Regression
    ${chrome options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}  Create Dictionary
    ...  download.default_directory=C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\TestData\\Download
    Call Method  ${chrome options}  add_experimental_option  prefs  ${prefs}
    Create Webdriver  Chrome  chrome_options=${chrome options}
    Goto  https://the-internet.herokuapp.com/download
    Click Link  css:[href="download/Image0019.jpg"]
    Sleep  5s
    ${files}  List Files In Directory  C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\TestData\\Download
    Length Should Be  ${files}  1
    Close Browser