*** Settings ***
Documentation     Checkout validation tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Checkout Validation Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
First Name Required
    [Documentation]    Verify error when first name missing
    [Tags]    checkout    validation
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Click Button    ${CONTINUE_BUTTON}
    Verify Error Message Contains    Error: First Name is required

Last Name Required
    [Documentation]    Verify error when last name missing
    [Tags]    checkout    validation
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Input Text    ${FIRST_NAME_FIELD}    John
    Click Button    ${CONTINUE_BUTTON}
    Verify Error Message Contains    Error: Last Name is required

Postal Code Required
    [Documentation]    Verify error when postal code missing
    [Tags]    checkout    validation
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Input Text    ${FIRST_NAME_FIELD}    John
    Input Text    ${LAST_NAME_FIELD}     Smith
    Click Button    ${CONTINUE_BUTTON}
    Verify Error Message Contains    Error: Postal Code is required
