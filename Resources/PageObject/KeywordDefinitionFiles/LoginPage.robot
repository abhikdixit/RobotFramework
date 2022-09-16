*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Variables ***
# Login Page locators
LoginUsernameInputBox = "id:txtUsername"
LoginPasswordInputBox = "id:txtPassword"
LoginButton = "id:btnLogin"
ForgetLink = "Forgot your password?"

*** Keywords ***
Input Username
    Input Text  ${LoginUsernameInputBox}  ${Username}

Input Password
    Input Text  ${LoginPasswordInputBox}  ${Password}

Click Login
    Click Element  ${LoginButton}

GoTo ForgetPassword Page
    click link      ${ForgetLink}