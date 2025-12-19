*** Settings ***
Documentation     Login test cases for SauceDemo application
...               This test suite validates various login scenarios
...               including valid credentials, invalid credentials,
...               empty fields, and locked out users.

Resource          ../resources/variables.robot
Resource          ../resources/keywords.robot

Suite Setup       Log To Console    \n🚀 Starting Login Test Suite
Suite Teardown    Log To Console    \n✅ Login Test Suite Completed

Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Valid Login Test
    [Documentation]    Verify user can login with valid credentials
    [Tags]    smoke    critical    positive
    Open Login Page
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Verify Login Success

Invalid Login Test
    [Documentation]    Verify error message when using invalid credentials
    [Tags]    negative    login
    Open Login Page
    Login With Credentials    ${INVALID_USER}    ${INVALID_PASS}
    Verify Login Failure
    Verify Error Message Contains    Username and password do not match

Empty Credentials Test
    [Documentation]    Verify error when submitting empty login form
    [Tags]    negative    validation
    Open Login Page
    Click Button    ${LOGIN_BUTTON}
    Verify Login Failure
    Verify Error Message Contains    Username is required

Empty Username Test
    [Documentation]    Verify error when username field is empty
    [Tags]    negative    validation
    Open Login Page
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${VALID_PASS}
    Click Button    ${LOGIN_BUTTON}
    Verify Login Failure

Empty Password Test
    [Documentation]    Verify error when password field is empty
    [Tags]    negative    validation
    Open Login Page
    Input Text    ${LOGIN_USERNAME_FIELD}    ${VALID_USER}
    Click Button    ${LOGIN_BUTTON}
    Verify Login Failure

Locked Out User Test
    [Documentation]    Verify locked out user cannot login
    [Tags]    negative    security
    Open Login Page
    Login With Credentials    ${LOCKED_USER}    ${VALID_PASS}
    Verify Login Failure
    Verify Error Message Contains    Sorry, this user has been locked out

Clear Fields Functionality Test
    [Documentation]    Verify user can clear and re-enter credentials
    [Tags]    positive    usability
    Open Login Page
    Input Text    ${LOGIN_USERNAME_FIELD}    wrong_user
    Input Text    ${LOGIN_PASSWORD_FIELD}    wrong_pass
    Clear Login Fields
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Verify Login Success

Case Sensitive Username Test
    [Documentation]    Verify username is case sensitive
    [Tags]    negative    validation
    Open Login Page
    Login With Credentials    STANDARD_USER    ${VALID_PASS}
    Verify Login Failure


*** Keywords ***
# Test-specific keywords can be added here if needed
