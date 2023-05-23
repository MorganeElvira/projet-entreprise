*** Settings ***
Library    SeleniumLibrary
#Library    AutoRecorder    mode=suite
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
    Input Text    data:testid:header-create-team-name-input    Pixel Test
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
    Go To    https://trello.com/b/IgKpIUYQ/test-titre
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

Scenario 06 - Create cards
    Browser Setup
    Connexion    ${email}    ${password}
    Go To    https://trello.com/b/IgKpIUYQ/test-titre
    # First card
    Wait Until Element Is Visible    class:placeholder
    Click Element    class:js-add-a-card
    Wait Until Element Is Visible    class:list-card-composer-textarea
    Input Text    class:list-card-composer-textarea    First card creation
    Click Button    class:nch-button
    Element Should Be Visible    class:list-card-title
    # Second card
    Wait Until Element Is Visible    class:list-card-composer-textarea
    Input Text    class:list-card-composer-textarea    Second card creation
    Click Button    class:nch-button
    Element Should Be Visible    class:list-card-title

Scenario 07 - Editing a card
    Browser Setup
    Connexion    ${email}    ${password}
    Go To    https://trello.com/b/IgKpIUYQ/test-titre
    Wait Until Element Is Visible    class:list-card-details
    Click Element    class:list-card-details
    Wait Until Element Is Visible    class:card-detail-window
    Click Element    class:subscribe-detail-button
    Element Should Be Visible    class:icon-check
    Click Element    class:description-content
    Wait Until Element Is Visible    id:ak-editor-textarea
    Input Text    id:ak-editor-textarea    Writing a test for card edition in Trello website
    Element Should Be Visible    id:ak-editor-textarea
    Element Should Contain    id:ak-editor-textarea    Writing a test for card edition in Trello website
    Click Element    class:js-change-card-members
    Wait Until Element Is Visible    class:pop-over-content
    Click Element    css:ul.pop-over-member-list li.item.js-member-item:nth-child(1) a.name.js-select-member
    Click Element    css:ul.pop-over-member-list li.item.js-member-item:nth-child(2) a.name.js-select-member
    Element Should Be Visible    data:idmem:646b7d2a4b96e4ce9f7606d9
    Element Should Be Visible    data:idmem:646b1cd4347fb3e039504135
    Sleep    2

Scenario 08 - Drag and drop a card to another list
    Browser Setup
    Connexion    ${email}    ${password}
    Go to    https://trello.com/b/IgKpIUYQ/test-titre
    Wait Until Element Is Visible    class:list-card-details
    ${card}    Get Webelement    css:div.list-cards a.list-card:first-child
    ${destination_list}    Get Webelement    css:div.js-list.list-wrapper.list-wrapper-with-margins:nth-child(2)
    Drag And Drop    ${card}    ${destination_list}
    Wait Until Page Contains Element    css:div.js-list.list-wrapper.list-wrapper-with-margins:nth-child(2) div.list-cards a.list-card:first-child