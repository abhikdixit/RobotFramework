*** Settings ***
Library     SSHLibrary

*** Test Cases ***
Login to Linux Machine
    OPEN CONNECTION     192.168.0.159
    login       adixit      test123
    ${output}=      execute command     'Linux command'
    Log to console        ${output}
    close connection