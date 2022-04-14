*** Settings ***
Documentation  Iframes in Robot Framework
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify that a string can be written and read from a Simple Iframe
    [documentation]  This test case verifies that a string can be written and read from an Iframe.
    Open Browser  https://the-internet.herokuapp.com/iframe  Chrome
    Wait Until Element Is Visible  css:[role="menubar"]  timeout=5
    Select Frame  id:mce_0_ifr
    Click Element  id:tinymce
    Clear Element Text  id:tinymce
    Input Text  id:tinymce  Input from Robot Framework Test
    Element Text Should Be  id:tinymce  Input from Robot Framework Test
    Sleep       2s
    Close Browser