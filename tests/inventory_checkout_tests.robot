*** Settings ***
Documentation     Inventory and checkout tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Inventory and Checkout Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Add Single Item To Cart
    [Documentation]    Verify a user can add an item to the cart
    [Tags]    smoke    cart
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Page Should Contain Element    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    1

Remove Item From Cart
    [Documentation]    Verify removing an item clears the badge
    [Tags]    regression    cart
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Remove First Item From Cart
    Run Keyword And Expect Error    *
    ...    Element Should Be Visible    ${CART_BADGE}

Checkout Happy Path
    [Documentation]    Verify checkout completes with valid info
    [Tags]    critical    checkout
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Fill Checkout Information    Jane    Doe    12345
    Complete Checkout

Checkout Requires Customer Info
    [Documentation]    Verify checkout blocks submission when info is missing
    [Tags]    negative    checkout
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Click Button    ${CONTINUE_BUTTON}
    Verify Error Message Contains    Error: First Name is required
