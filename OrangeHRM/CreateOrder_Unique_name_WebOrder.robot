*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
*** Test Cases ***
Test1
   [documentation]  login to Web page
    Open Browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     firefox
    maximize browser window
            Input Text   id=ctl00_MainContent_username  Tester
            Input Text   id=ctl00_MainContent_password  test
            Click Button    id=ctl00_MainContent_login_button
            Sleep   2s
            Element Text Should Be   link=View all orders       View all orders
Test2
    [documentation]  Create Order and Verify that unique user have been added
        Click Link      link=Order
        Wait Until Element Is Visible       ctl00$MainContent$fmwOrder$cardList       timeout=10
        Select From List By Index  id=ctl00_MainContent_fmwOrder_ddlProduct  1
        List Selection Should Be  id:ctl00_MainContent_fmwOrder_ddlProduct  FamilyAlbum
        input text      id=ctl00_MainContent_fmwOrder_txtQuantity       1
        input text      id=ctl00_MainContent_fmwOrder_txtDiscount       20
        # Add Random number to Name field
        ${random_num} =     Generate Random String
        ${empname}=     Catenate    dixit${random_num}
        LOG TO CONSOLE      ${empname}
        input text      name=ctl00$MainContent$fmwOrder$txtName       ${empname}
        input text      name=ctl00$MainContent$fmwOrder$TextBox2       teststreet
        input text      name=ctl00$MainContent$fmwOrder$TextBox3      Delhi
        input text      name=ctl00$MainContent$fmwOrder$TextBox4     teststate
        input text      name=ctl00$MainContent$fmwOrder$TextBox5     1234
        Select Radio Button     ctl00$MainContent$fmwOrder$cardList        Visa
        input text      name=ctl00$MainContent$fmwOrder$TextBox6     1245678988
        input text      name=ctl00$MainContent$fmwOrder$TextBox1     10/24
        click link      link=Process
        page should contain     New order has been successfully added.
#Test3
    #[documentation]  Verify Added user under View All Order Page
    click link      View all orders
    Sleep      2s
    #page should contain     Abhi
    element text should be      //td[text()='${empname}']     ${empname}
    element text should be      //td[text()='${empname}']//following-sibling::td[text()='Delhi']     Delhi
Test4
    [documentation]  Logout from WebOrder
        click element        link=Logout
        Sleep      1s
        page should contain     Login
Test5
    [documentation]  Close the Browser
     close all browsers