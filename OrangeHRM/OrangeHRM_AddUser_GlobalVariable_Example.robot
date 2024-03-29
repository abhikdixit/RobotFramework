*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Test Cases ***

Launch OrangeHRM and login to application
    [tags]      E2ETest
    Open Browser	https://opensource-demo.orangehrmlive.com/	chrome
    Maximize Browser Window
    Input Text	xpath=//input[@id='txtUsername']	Admin
    Input Text	name=txtPassword	admin123
    #Click Button	xpath=//input[@id='btnLogin']
    Click Button	css=input[id='btnLogin']
    #Element Text Should Be	link=Dashboard	Dashboard
    Page Should Contain Link        Dashboard   timeout=5
Click on Admin->UserManagement->Users and Click on Add button
    #Mouse Over  link=Admin
    Mouse Over	link=Admin
    Sleep	2s
    Mouse Over	link=User Management
    Click Link	link=Users
    Click Button	name=btnAdd
Add Users Details and Click on Save button
    ${random_num} =     Generate Random String
    ${empname}=     Catenate    SEPARATOR=    Abhi    ${random_num}
    Log to Console      ${empname}
    # Set variable as Global, so that user can access in other test cases under Suite
    Set Global Variable   ${empname}
    Select From List By Label    id=systemUser_userType    Admin
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  ${empname}
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   5s
Verify that added user visible in WebTable and able to select the checkbox
    Table Should Contain        xpath=//table[@id='resultTable']        ${empname}
    #Click Element       xpath=//a[text()='${empname}']//parent::td/../td/input
    Sleep   5s
Delete the user from WebTable and verify
    #//a[normalize-space()='${empname}']//parent::td/../td/input
    #Verify that added user visible in WebTable and able to select the checkbox
    #Table Should Contain        xpath=//table[@id='resultTable']        ${empname}
    Click Element       xpath=//a[normalize-space()='${empname}']//parent::td/../td/input
    Sleep   5s
    Click Element       id=btnDelete
    Sleep   2s
    Click Element       id=dialogDeleteBtn
    Sleep   5s
Close Browser at end
    Close Browser