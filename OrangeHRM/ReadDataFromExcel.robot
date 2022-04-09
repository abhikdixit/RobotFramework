*** Settings ***
Documentation    Suite description
Library     Selenium
Library     ExcelLibrary

*** Test Cases ***
Open and Read Excel Sheet
#provide path of Excel file to Open Excel
    Open Excel      D:/Robot Framework/SwagLabTestData.xls
# Reading No of Columns in Excel Sheet
    ${strColCount} =  Get Column Count  Login
#Printing number of Columns on Console Log
    Log To Console  \nCols are => ${strColCount}
# Reading number of Rows in Excel Sheet
    Set Test Variable   ${Col_ID}   ${strColCount}
    ${strRowCount}  Get Row Count   Login
    Log To Console  \nRows are => ${strRowCount}