*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     SeleniumLibrary
Library     Collections
*** Variables ***
${dbname}       orangehrm
${dbuser}       root
${dbpasswd}     root
${dbhost}       localhost
${dbport}       3306
@{queryResults}

*** Test Cases ***
Read data from Database
   connect to database     pymysql     ${dbname}    ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
   table must exist     login
   check if exists in database  SELECT * FROM login
   @{queryResults}  QUERY   SELECT * FROM login
   log to console       ${queryResults}
   # Update JMETER to ROBOT in Login table for uname column
   ${output}=   Execute Sql String     update login set uname = 'ROBOT' where uname = 'JMETER'
   Should Be Equal As Strings  ${output}  None