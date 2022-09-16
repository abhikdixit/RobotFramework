*** Settings ***
Library    ../Selenium_Scripts/OrangeHRM_Login_Method_with_Input.py
Library     SeleniumLibrary
*** Test Cases ***
Example to demonstrate Python library usage
    Open OrangeHRM      Admin   admin123
    Element Present     Admin
Close Browser at end
    close browser