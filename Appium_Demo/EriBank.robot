*** Settings ***
Library    AppiumLibrary
*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    6.0
${DEVICE_NAME}      emulator-5554
${Activity_NAME}        com.experitest.ExperiBank.LoginActivity
${PACKAGE_NAME}         com.experitest.ExperiBank
*** Keywords ***
Open Eribank App
  Open Application   ${REMOTE_URL}
  ...        platformName=${PLATFORM_NAME}
  ...    platformVersion=${PLATFORM_VERSION}
  ...   deviceName=${DEVICE_NAME}
  ...   automationName=UiAutomator2
    ...    newCommandTimeout=25000
    ...    appActivity=${Activity_NAME}
    ...    appPackage=${PACKAGE_NAME}
*** Test Cases ***
Login to Eribank app and make payment
    Open Eribank App
    input text      id=com.experitest.ExperiBank:id/usernameTextField       company
    input text      id=com.experitest.ExperiBank:id/passwordTextField       company
    click element   id=com.experitest.ExperiBank:id/loginButton
    Sleep       3s
    element should be visible       id=com.experitest.ExperiBank:id/logoutButton
    #Make Payment
    click element    xpath=//*[contains(@text, 'Make Payment')]
    Sleep       3s
    input text      id=com.experitest.ExperiBank:id/phoneTextField       123456789
    Sleep       3s
    input text      id=com.experitest.ExperiBank:id/nameTextField       Dixit
    Sleep       3s
    input text    id=com.experitest.ExperiBank:id/amountTextField    1000
    Sleep       3s
    input text      id=com.experitest.ExperiBank:id/countryTextField       India
    Sleep       3s
    Click Element    id=com.experitest.ExperiBank:id/countryButton
    Sleep       3s
    Click Element    xpath=//*[contains(@text, 'India')]
    Sleep       3s
    Click Element    id=com.experitest.ExperiBank:id/sendPaymentButton
    Sleep       3s
    Click Element    id=android:id/button1
    Sleep       3s
    Click Element    id=com.experitest.ExperiBank:id/logoutButton
    Sleep       3s
    element should be visible       id=com.experitest.ExperiBank:id/loginButton
    Sleep       3s
    close all applications