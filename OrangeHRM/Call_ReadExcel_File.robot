*** Settings ***
Documentation    Suite description
Library  ../Resources/Read_Excel_File.py

*** Variables ***
${EXCEL_FILE_PATH}      D:\\F Drive\\RobotFramework_NewVersion\\testdata\\OrangeData.xlsx
*** Test Cases ***
Collect orders info
    ${orders}=    get orders    ${EXCEL_FILE_PATH}
    Log to Console    ${orders}