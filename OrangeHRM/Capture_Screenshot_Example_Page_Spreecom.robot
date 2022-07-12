*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Library         DateTime

*** Variables ***
${WEB}  https://demo.spreecommerce.org/
${BROWSER}  chrome
${TYPE OF FILE}  png
${filename}     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Screenshot\\

*** Test Cases ***
Launch OrangeHRM Login Page
    ${Date}=        Get DateTime
    Open Browser    ${WEB}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, 500)
    #Capture Page Screenshot     C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\Screenshot\\LoginPage${Date}.png
    Capture Page Screenshot     ${filename}LoginPage${Date}.${TYPE OF FILE}
    #Page Should Contain Button    id=ctl00_MainContent_login_button
    Sleep    5s
    Execute JavaScript    window.scrollTo(500, 1000)
    Capture Page Screenshot     ${filename}LoginPage1${Date}.${TYPE OF FILE}

Close browser at end
    Sleep   2s
    Close Browser

*** Keywords ***

Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}