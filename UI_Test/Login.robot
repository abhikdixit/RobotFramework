*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Verify Login Scenario of Web Order
    open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     firefox
    input text      id=ctl00_MainContent_username       Tester
    input password      id=ctl00_MainContent_password       test
    click element    id=ctl00_MainContent_login_button
    Sleep       2s
    element text should be      link=Logout     Logout
    element text should be      xpath=//h2      List of All Orders
Logout from Application and Verify that user has logged out
    click link      Logout
    Sleep       2s
    page should contain button      Login
Close the Browser
    close browser


