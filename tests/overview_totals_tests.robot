*** Settings ***
Documentation     Overview totals tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Overview Totals Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Totals Labels Present On Overview
    [Documentation]    Verify subtotal, tax, and total labels present
    [Tags]    checkout    totals
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Fill Checkout Information    Alex    Doe    99999
    Proceed To Overview
    Page Should Contain Element    ${SUMMARY_SUBTOTAL}
    Page Should Contain Element    ${SUMMARY_TAX}
    Page Should Contain Element    ${SUMMARY_TOTAL}

Single Item Totals Math Matches Price
    [Documentation]    Verify overview subtotal equals single item price and total is positive
    [Tags]    checkout    totals    math
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Fill Checkout Information    Alex    Doe    99999
    Proceed To Overview
    Verify Overview Totals Single Item
