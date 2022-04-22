*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php     chrome
    Maximize Browser Window
    Click Link      link=Forgot your password?
    Sleep   2s
    Title Should Be     OrangeHRM
    Element Text Should Be	xpath=//h1[normalize-space()='Forgot Your Password?']       Forgot Your Password?
    ${currenturl}=       Get Location
    run keyword if      '${currenturl}'=='https://opensource-demo.orangehrmlive.com/index.php/auth/requestPasswordResetCode'        Go Back
    Sleep   2s
    ${currenturl}=       Get Location
    Log to console      ${currenturl}
    Title Should Be     OrangeHRM
    Sleep   2s
    Close Browser