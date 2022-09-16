*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary


*** Test Cases ***
Launch OrangeHRM Login Page

    Open Browser    https://www.google.com/  ff
    Maximize Browser Window
    Input Text	name=q	selenium
    Press Keys  name=q  RETURN
    Sleep       5s
    #Press Keys  xpath=//*[@id='tsf']//div[2]/div/ul/li    RETURN
    @{result_on_page}=      Get WebElements     xpath=//div[@id='rso']/div
    FOR     ${element}  IN      @{result_on_page}
        ${text}=    Get Text    ${element}
        Log to Console    ${text}
        Sleep       2s
    END
    Close Browser