*** Settings ***
Documentation     Simple login tests for Sauce Demo (TC-001, TC-002, TC-003)
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.saucedemo.com/    headlesschrome
Suite Teardown    Close Browser

*** Variables ***
${USERNAME_FIELD}    id:user-name
${PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}       id:login-button
${ERROR_MESSAGE}      css:[data-test="error"]

*** Test Cases ***
TC-001 Valid Login Succeeds
    Input Text    ${USERNAME_FIELD}    standard_user
    Input Text    ${PASSWORD_FIELD}    secret_sauce
    Click Button    ${LOGIN_BUTTON}
    Location Should Contain    inventory.html
    Go To    https://www.saucedemo.com/

TC-002 Invalid Password Shows Error
    Input Text    ${USERNAME_FIELD}    standard_user
    Input Text    ${PASSWORD_FIELD}    wrong_password
    Click Button    ${LOGIN_BUTTON}
    Element Should Contain    ${ERROR_MESSAGE}    do not match
    Go To    https://www.saucedemo.com/

TC-003 Locked Out User Is Blocked
    Input Text    ${USERNAME_FIELD}    locked_out_user
    Input Text    ${PASSWORD_FIELD}    secret_sauce
    Click Button    ${LOGIN_BUTTON}
    Element Should Contain    ${ERROR_MESSAGE}    locked out
