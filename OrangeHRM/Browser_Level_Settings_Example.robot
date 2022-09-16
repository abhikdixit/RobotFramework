*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
#List Variables
@{search_text}      mobile      tv      ipad

*** Test Cases ***
Search for Product
    Open Browser	https://www.amazon.in/	ff      options=add_experimental_option("excludeSwitches",["enable-logging"])
    Input Text	id=twotabsearchtextbox	${search_text}[2]
    Click Button	xpath=//input[@value='Go']
    Sleep	5s
    Page Should Contain	results for "${search_text}[2]"

Close Browser
    Close Browser