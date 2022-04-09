*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM and login to application
    [Tags]    Regression
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

    Select From List By Label    id=systemUser_userType    Admin
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  Kumar55
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   2s
Verify that User added to WebTable
    Element Text Should Be	xpath=//a[text()='Kumar55']     Kumar55
    Sleep   2s
    Click Element       xpath=//a[text()='Kumar55']//parent::td/../td/input
    Sleep   5s
Delete the User from List and Verify that Deleter user not preset in webtable
    click button    id=btnDelete
    Sleep   2s
    click button    id=dialogDeleteBtn
    Sleep   2s
    page should not contain element     Kumar55

Close Browser at end
    Close Browser