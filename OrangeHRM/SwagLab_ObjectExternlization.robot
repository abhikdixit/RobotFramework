*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../Resources/commonfunctionality.robot
Resource    ../TestData/ConfigData.robot

*** Test Cases ***
Verify Login Functionality of SauceLab Application

    Start TestCase
    Input Text	${txtbox_username}	standard_user
    Input Text	${txtbox_password}	secret_sauce
    Click Button    ${btn_login}
    Sleep   2s
    Element Text Should Be  class=product_label     Products
    Finish TestCase