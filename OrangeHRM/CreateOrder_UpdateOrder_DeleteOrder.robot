*** Settings ***
Documentation    Test for Editing and Deleting a Web Order - Assignment 3 & 4
Library     SeleniumLibrary
Library     DependencyLibrary
Library     String

*** Test Cases ***
Login_to_WebOrder
    [documentation]     Test to verify that the user can login to the Web Order page
    [Tags]      CreateOrderLogin
    open browser        http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     ff
    maximize browser window
    input text      id=ctl00_MainContent_username       Tester
    input text      id=ctl00_MainContent_password       test
    click button        ctl00$MainContent$login_button
    element text should be      tag=h2      List of All Orders
Create_new_order
    depends on test      login_to_WebOrder
    [documentation]     Test to verify that the user can create a new order, verify order created, edit order and delete order
    [Tags]      EditAndDeleteOrder
    click link      Order
    wait until element is visible       id=ctl00_MainContent_fmwOrder_InsertButton      timeout=10
    select from list by value       id=ctl00_MainContent_fmwOrder_ddlProduct        FamilyAlbum
    input text      id=ctl00_MainContent_fmwOrder_txtQuantity       10
    input text      id=ctl00_MainContent_fmwOrder_txtUnitPrice      1000
    input text      id=ctl00_MainContent_fmwOrder_txtDiscount       15
    click button        Calculate
    # generate random number and Concatenate with username
    ${random_num} =     generate random string
    ${empname}=     Catenate        Shreyas${random_num}
        # Set variable as Global, so that user can access in other test cases under Suite
        Set Global Variable   ${empname}
        #GlobalVariable
    input text      id=ctl00_MainContent_fmwOrder_txtName       ${empname}
    input text      id=ctl00_MainContent_fmwOrder_TextBox2      First Street
    input text      id=ctl00_MainContent_fmwOrder_TextBox3      Best City
    input text      id=ctl00_MainContent_fmwOrder_TextBox4      Best State
    input text      id=ctl00_MainContent_fmwOrder_TextBox5      560001
    select radio button     ctl00$MainContent$fmwOrder$cardList     American Express
    input text      id=ctl00_MainContent_fmwOrder_TextBox6      123456789012
    input text      id=ctl00_MainContent_fmwOrder_TextBox1      10/22
    click link      Process
    wait until element is visible       tag=strong
    element text should be      tag=strong      New order has been successfully added.
    click link      View all orders
    element text should be      xpath=//td[text()='${empname}']       ${empname}
Update_the_order_Verify_the_order
    click element       xpath=//td[text()='${empname}']//following-sibling::td//input
    input text      id=ctl00_MainContent_fmwOrder_TextBox4      Karnataka
    click link      Update
    element text should be      xpath=//td[text()='${empname}']//following-sibling::td[text()='Karnataka']      Karnataka
Deleting the user and verify that user got deleted
    select checkbox     xpath=//td[text()='${empname}']//preceding-sibling::td//input
    click button        Delete Selected
    element should not be visible       xpath=//td[text()='${empname}']
    # Alternative command
    page should not contain     ${empname}
Logout_WebOrder
    depends on test      login_to_WebOrder
    [documentation]     Test whether the user has logged out of Web Order
    [Tags]      CreateOrderLogout
    click link      Logout
    element attribute value should be       name=ctl00$MainContent$login_button     value       Login
Close_browser
    close browser