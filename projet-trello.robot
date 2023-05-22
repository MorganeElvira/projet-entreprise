*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot

*** Variables ***
${email}    skullyshepard@gmail.com
${password}    _R0swoD=WLwRl+e##ego

*** Test Cases ***
Scenario 01 - Connexion KO
    Browser Setup
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
    Browser Setup
    Connexion    ${email}    ${password}

Scenario 03 - Create a workspace
    Browser Setup
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
    Browser Setup
    Connexion    ${email}    ${password}
    Click Element    data:testid:create-board-tile
    Element Should Contain    data:testid:create-board-tile   Créer un tableau
    Input Text    data:testid:create-board-title-input    To do list
    Sleep    2
    Click Button    data:testid:create-board-submit-button

Scenario 05 - Add lists
    Browser Setup
    Connexion    ${email}    ${password}
    Click Link    /b/IgKpIUYQ/test-titre
    Wait Until Element Is Visible    class:placeholder
    Click Element    class:placeholder
    # Add first list
    Input Text    class:list-name-input    To do
    Click Button    class:nch-button
    # Add second list
    Input Text    class:list-name-input    In progress
    Click Button    class:nch-button
    # Add third list
    Input Text    class:list-name-input    Done
    Click Button    class:nch-button

Scenario 06 - Create a card
    Browser Setup
    Connexion    ${email}    ${password}
    Click Link    /b/IgKpIUYQ/test-titre
    Wait Until Element Is Visible    class:placeholder
    Click Element    class:js-add-a-card
    Wait Until Element Is Visible    class:list-card-composer-textarea
    Input Text    class:list-card-composer-textarea    Connexion OK
    Click Button    class:nch-button
    Element Should Be Visible    class:list-card-title

Scenario 07 - Editing a card