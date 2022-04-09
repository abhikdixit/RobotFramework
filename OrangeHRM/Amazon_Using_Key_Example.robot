*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${search_text}  jeans
*** Test Cases ***
Search for Mobile
    Open Browser	https://www.amazon.in/	chrome
    Input Text	id=twotabsearchtextbox	${search_text}
    Press Keys  id=twotabsearchtextbox  ENTER
    Sleep	5s
    Page Should Contain	results for "${search_text}"
    Close Browser