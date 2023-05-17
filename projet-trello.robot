*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    https://trello.com/home    chrome

*** Variables ***
${userEmail}    morgane.elvira@gmail.com

*** Test Cases ***
Connexion échouée
    Maximize Browser Window
    Click Element    data:uuid:MJFtCCgVhXrVl7v9HA7EH_login
    Input Text    id:user    morgane.elvira@gmmail.com
    Click Button    id:login
    Sleep    2
    Input Password    id:password    sp_tOprAS5SWLrIFrUy9
    Click Button    id:login
    Sleep    2
    Element Should Be Visible    id:error
    Element Should contain    class:quick-switch    Il n'y a pas de compte