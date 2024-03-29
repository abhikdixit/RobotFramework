*** Settings ***
Documentation  Page Object in Robot Framework
Library     SeleniumLibrary
Resource    ../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource    ../Resources/PageObject/KeywordDefinitionFiles/HomePage.robot
Resource    ../Resources/PageObject/KeywordDefinitionFiles/Common.robot

Suite Setup         Begin Web Test      ${site_url}     ${browser}
Suite Teardown      End Web Test

*** Variables ***
${site_url}     https://opensource-demo.orangehrmlive.com/
${browser}      Chrome

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that the user is able to successfully Login and Logout to OrangeHRM using Page Object
    [tags]  Smoke   Sanity
    #Opening Browser  ${site_url}  ${browser}
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    LogoutFromApp