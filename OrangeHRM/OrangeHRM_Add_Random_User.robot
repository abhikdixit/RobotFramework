*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Test Cases ***
Launch OrangeHRM and login to application
    Open Browser	https://opensource-demo.orangehrmlive.com/web/index.php/auth/login	chrome
        Maximize Browser Window
        Sleep	2s
        Input Text	    name=username	    Admin
        Sleep	2s
        Input Text	    name=password	    admin123
        Sleep	2s
        #Click Button	xpath=//input[@id='btnLogin']
        Click Button	css=button[type='submit']
        Sleep	2s
    #Verify that user is on Dashboard page
    element text should be  xpath=//span[normalize-space()='Dashboard']     Dashboard
    Sleep	2s
Click on Admin->UserManagement->Users and Click on Add button
    #Mouse Over  link=Admin
    click element	xpath=//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name'][normalize-space()='Admin']
    Sleep	2s
    click element	xpath=//button[normalize-space()='Add']
    Sleep	2s
Add Users Details and Click on Save button
    ${random_num} =     Generate Random String
    ${empname}=     Catenate    dixit${random_num}
    LOG TO CONSOLE      ${empname}
    Sleep	2s
    click element       xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-select-text--arrow']
    Sleep	2s
    click element       xpath=//div[@class='oxd-select-text-input'][text()='Admin']
    #input text      xpath=//div[@class='oxd-select-text-input']       ESS
    #Select From List By Label    xpath=//body/div[@id='app']/div[@class='oxd-layout']/div[@class='oxd-layout-container']/div[@class='oxd-layout-context']/div[@class='orangehrm-background-container']/div[@class='orangehrm-card-container']/form[@class='oxd-form']/div[@class='oxd-form-row']/div[@class='oxd-grid-2 orangehrm-full-width-grid']/div[1]/div[1]/div[1]    Admin
    Sleep	5s
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  ${empname}
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   5s
    Page Should Contain Link        link=${empname}

Close Browser at end

    #LOG TO CONSOLE      ${empname}
    Close Browser