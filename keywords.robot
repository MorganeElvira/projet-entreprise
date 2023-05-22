*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Connexion
    [Arguments]    ${email}    ${password}
    Maximize Browser Window
    Click Element    data:uuid:MJFtCCgVhXrVl7v9HA7EH_login
    Input Text    id:user    ${email}
    Click Button    id:login
    Sleep    2
    Input Password    id:password    ${password}
    Click Button    id:login-submit
    Sleep    3
    Location Should Be    https://trello.com/u/skullyshepard/boards