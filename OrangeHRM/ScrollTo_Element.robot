*** Settings ***
Library         SeleniumLibrary

*** Test Cases ***
Scroll
    Open Browser   https://demo.spreecommerce.org/    Chrome
    Maximize Browser Window
    #Scroll Element Into View     xpath://a[normalize-space()='Start your free trial']
    Scroll Element Into View     xpath=//div[@class='homepage-bottom-box-inner-big-text']
    Sleep   5s
    click element      xpath=//div[@class='homepage-bottom-box-inner-big-text']
    Sleep   5s
    Close All Browsers