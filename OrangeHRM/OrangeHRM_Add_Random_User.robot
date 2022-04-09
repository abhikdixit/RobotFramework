*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM and login to application
    Open Browser	https://opensource-demo.orangehrmlive.com/	chrome
    Maximize Browser Window
    Input Text	xpath=//input[@id='txtUsername']	Admin
    Input Text	name=txtPassword	admin123
    #Click Button	xpath=//input[@id='btnLogin']
    Click Button	css=input[id='btnLogin']
    #Element Text Should Be	link=Dashboard	Dashboard
    Page Should Contain Link        Dashboard
Click on Admin->UserManagement->Users and Click on Add button
    #Mouse Over  link=Admin
    Mouse Over	link=Admin
    Sleep	2s
    Mouse Over	link=User Management
    Click Link	link=Users
    Click Button	name=btnAdd
Add Users Details and Click on Save button
    #${random_num}    Generate random string    4    0123456789
    Select From List By Label    id=systemUser_userType    Admin
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  Kumar+str(random_num)
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   2s
Close Browser
    Close browser