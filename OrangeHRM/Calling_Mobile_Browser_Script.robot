*** Settings ***
Library    ../Resources/Mobile_Browser_View.py

*** Test Cases ***
Example to demonstrate Python library usage
    ${name}=        Mobile_Browser_View.retrieve_a_country(self)
    Log to Console      ${name}
