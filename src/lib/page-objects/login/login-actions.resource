*** Settings ***
Library    SeleniumLibrary
Variables    .${/}login-locators.py
Resource    ${GENERIC_PAGE_ACTIONS_PATH}
Resource    ${GENERIC_BDD_PAGE_ACTIONS_PATH}

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Type Text Into Input    selector=${USERNAME_INPUT}    text=${username}

Input Password
    [Arguments]    ${password}
    Type Text Into Input    selector=${PASSWORD_INPUT}    text=${password}

Click LogIn Button
    generic-actions.Click Button    ${LOGIN_BUTTON}

I Log Into Agona
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click LogIn Button
    I Am Logged In
    