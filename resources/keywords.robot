*** Settings ***
Library           SeleniumLibrary
Resource          variables.robot

Documentation     Common keywords for login functionality


*** Keywords ***
Open Login Page
    [Documentation]    Opens browser and navigates to the login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Swag Labs

Login With Credentials
    [Documentation]    Enters username and password, then clicks login
    [Arguments]    ${username}    ${password}
    Input Text     ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text     ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button   ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Verifies user successfully logged in
    Wait Until Page Contains Element
    ...    ${INVENTORY_LIST}
    ...    timeout=${DEFAULT_TIMEOUT}
    Location Should Contain    inventory.html
    Page Should Contain Element    ${INVENTORY_LIST}

Verify Login Failure
    [Documentation]    Verifies error message is displayed
    Wait Until Page Contains Element
    ...    ${ERROR_MESSAGE}
    ...    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${ERROR_MESSAGE}

Get Error Message Text
    [Documentation]    Returns the error message text
    ${error_text}=    Get Text    ${ERROR_MESSAGE}
    [Return]    ${error_text}

Close Browser Session
    [Documentation]    Captures screenshot and closes browser
    Capture Page Screenshot
    Close Browser

Clear Login Fields
    [Documentation]    Clears username and password fields
    Clear Element Text    ${LOGIN_USERNAME_FIELD}
    Clear Element Text    ${LOGIN_PASSWORD_FIELD}

Login As Valid User
    [Documentation]    Complete login flow with valid credentials
    Open Login Page
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Verify Login Success

Login As Invalid User
    [Documentation]    Complete login flow with invalid credentials
    Open Login Page
    Login With Credentials    ${INVALID_USER}    ${INVALID_PASS}
    Verify Login Failure

Login As Locked User
    [Documentation]    Complete login flow with locked user
    Open Login Page
    Login With Credentials    ${LOCKED_USER}    ${VALID_PASS}
    Verify Login Failure

Verify Error Message Contains
    [Documentation]    Verifies error message contains expected text
    [Arguments]    ${expected_text}
    ${actual_text}=    Get Error Message Text
    Should Contain    ${actual_text}    ${expected_text}
