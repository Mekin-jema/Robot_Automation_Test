*** Settings ***
Documentation     Data-driven login tests sourced from Excel-compatible CSV
Resource          ../../resources/keywords.robot
Library           DataDriver    file=../../data/login_test_cases.csv    dialect=excel

Suite Setup       Initialize Suite
Test Teardown     Close Browser Session
Test Template     Execute Login Row


*** Test Cases ***
Login {username} expects {expected_outcome}
    [Documentation]    {description}
    [Tags]    login


*** Keywords ***
Execute Login Row
    [Arguments]    ${username}    ${password}    ${expected_outcome}    ${description}
    Open Login Page
    Login With Credentials    ${username}    ${password}
    Run Keyword If    '${expected_outcome}' == 'success'
    ...    Verify Login Success
    ...    ELSE
    ...    Verify Login Failure
