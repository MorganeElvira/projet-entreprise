*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    https://trello.com/    chrome
Resource    keywords.robot

*** Variables ***
${email}    skullyshepard@gmail.com
${password}    _R0swoD=WLwRl+e##ego

*** Test Cases ***
Scenario 01 - Connexion KO
    Maximize Browser Window
    Click Element    data:uuid:MJFtCCgVhXrVl7v9HA7EH_login
    Input Text    id:user    skullyshepard@gmmail.com
    Click Button    id:login
    Sleep    2
    Input Password    id:password    ${password}
    Click Button    id:login
    Sleep    2
    Element Should Be Visible    id:error
    Element Should contain    class:quick-switch    Il n'y a pas de compte

Scenario 02 - Connexion OK
    Maximize Browser Window
    Click Element    data:uuid:MJFtCCgVhXrVl7v9HA7EH_login
    Input Text    id:user    ${email}
    Click Button    id:login
    Sleep    2
    Input Password    id:password    ${password}
    Click Button    id:login-submit
    Sleep    3
    Location Should Be    https://trello.com/u/skullyshepard/boards

Scenario 03 - Create a workspace
    Maximize Browser Window
    Connexion    ${email}    ${password}
    Click Button    data:testid:header-create-menu-button
    Wait Until Element Is Visible    data:testid:header-create-team-button
    Click Button    data:testid:header-create-team-button
    Wait Until Element Is Visible    class:yrkIKrxkTvj0rD
    Element Should Contain    class:yrkIKrxkTvj0rD    Créons un espace de travail
    Input Text    data:testid:header-create-team-name-input    Undefined
    Click Element    data:testid:header-create-team-type-input
    Click Element    xpath://div[normalize-space()='Ingénierie/informatique']
    Click Button    data:testid:header-create-team-submit-button
    Wait Until Element Is Visible    data:testid:add-members-input
    Input Text    data:testid:add-members-input    lyniebc@gmail.com
    Click Button    data:testid:team-invite-submit-button

Scenario 04 - Create a board
    Maximize Browser Window
    