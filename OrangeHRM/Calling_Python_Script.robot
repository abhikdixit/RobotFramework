*** Settings ***
Library     StringConcatanation.py

*** Test Cases ***
Example to demonstrate Python library usage

| | ${result}= | concatenate strings | Abhi | Dixit
| | Should be equal | ${result} | AbhiDixit