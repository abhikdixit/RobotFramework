*** Settings ***
Library    ../Resources/Mobile_Browser_View.py

*** Test Cases ***
Example to demonstrate Python library usage
    ${name}=        Mobile_Browser_View.test_get_id_details(self)
    Log to Console      ${name}
