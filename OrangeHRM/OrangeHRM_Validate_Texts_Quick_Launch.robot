*** Settings ***
Documentation  Looping in Robot Framework
Library  SeleniumLibrary
Library  Collections

*** Variables ***
#Expected Value
@{quickLaunchList}  Assign Leave  Leave List  Timesheets  Apply Leave  My Leave  My Timesheet

*** Test Cases ***
TS_001
    [documentation]  This test case verifies that the quick launch texts from the webpage matches our Text list.
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible  id:txtUsername  timeout=5
    Input Text  id:txtUsername  Admin
    Input Password  id:txtPassword  admin123
    Click Element  id:btnLogin
    Element Should Be Visible  id:welcome  timeout=5


    @{elementList}=  Get WebElements    xpath=//div[@class='quickLaunge']
    #css:div.quickLaunge
    @{textList}=    Create List
    FOR  ${element}  IN  @{elementList}
         ${text}=  Get Text  ${element}
         Append To List  ${textList}  ${text}
    END
    Log To Console  \n List from WebPage:
    Log To Console  ${textList}
    Log To Console  Expected List:
    Log To Console  ${quickLaunchList}
    #Below will check the count matching or not
    Lists Should Be Equal  ${textList}  ${quickLaunchList}
    #Below will check the string or value matching or not between List 1 and List 2
    List Should Contain Sub List    ${textList}  ${quickLaunchList}
    Close Browser