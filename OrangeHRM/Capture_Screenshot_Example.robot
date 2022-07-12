*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Library         DateTime

*** Variables ***
${WEB}  http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx
${BROWSER}  chrome
${TYPE OF FILE}  png
${filename}     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Screenshot\\

*** Test Cases ***
Launch OrangeHRM Login Page
    ${Date}=        Get DateTime
    Open Browser    ${WEB}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    #Capture particular Element Screenshot
    #Capture Element Screenshot      id=ctl00_MainContent_btnDelete      C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Screenshot\\Delete${Date}.png
    Capture Element Screenshot      id=ctl00_MainContent_btnDelete      ${filename}Delete${Date}.${TYPE OF FILE}
    Click Link      Logout
    #Capture Page Screenshot     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Screenshot\\LoginPage${Date}.png
    Capture Page Screenshot     ${filename}LoginPage${Date}.${TYPE OF FILE}
    Page Should Contain Button    id=ctl00_MainContent_login_button

Close browser at end
    Sleep   2s
    Close Browser

*** Keywords ***

Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}