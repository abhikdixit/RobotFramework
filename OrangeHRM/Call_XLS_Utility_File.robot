*** Settings ***
Documentation    Suite description
Library  ../Resources/XLUtils.py

*** Variables ***
${EXCEL_FILE_PATH}      C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\TestData\\OrangeData.xlsx
${SHEET_NAME}       Order
${ROW_NUMBER}       ${2}
${COL_NUMBER}       ${2}
*** Test Cases ***
Count the ROW
    ${orders}=    Row Count    ${EXCEL_FILE_PATH}     ${SHEET_NAME}
    Log to Console    ${orders}
Count the COL
    ${orders}=    Column Count    ${EXCEL_FILE_PATH}     ${SHEET_NAME}
    Log to Console    ${orders}
Read the data based on row and column
    ${orders}=    Read Data    ${EXCEL_FILE_PATH}     ${SHEET_NAME}      ${ROW_NUMBER}       ${COL_NUMBER}
    Log to Console    ${orders}

Write Data to File
    ${orders}=    Write Data    ${EXCEL_FILE_PATH}     ${SHEET_NAME}      ${ROW_NUMBER}       ${COL_NUMBER}      Python
    Log to Console    ${orders}