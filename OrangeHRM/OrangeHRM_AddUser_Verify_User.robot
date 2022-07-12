*** Settings ***
Documentation    Add user and Verify that user get added in Search Page
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM and login to application
    [Tags]    Smoke
    [documentation]  This test case Login to OrangeHRM app and verify that Dashboard page display
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
    [documentation]  Enter all mandatory details to Add user.
    Select From List By Label    id=systemUser_userType    Admin
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  Kumar
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   2s
Verify that User added to WebTable
    [documentation]  Verify that Added user display in Search WebTable List
    Table Should Contain        xpath=//table[@id='resultTable']        Kumar
    #Element Text Should Be	xpath=//a[text()='Kumar22'] 	Kumar22
    Sleep   2s
    Click Element       xpath=//a[text()='Kumar']//parent::td/../td/input
    Sleep   5s
Close Browser at end
    Close Browser