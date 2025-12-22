*** Settings ***
Documentation     Cart page tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Cart Page Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Continue Shopping Returns To Inventory
    [Documentation]    Verify continue shopping button returns to inventory
    [Tags]    cart    navigation
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Continue Shopping
    Page Should Contain Element    ${INVENTORY_LIST}

Cancel Checkout From Step One Returns To Cart
    [Documentation]    Verify cancel at step one returns to cart
    [Tags]    cart    checkout
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Cancel Checkout From Step One
    Location Should Contain    cart.html

Cancel Checkout From Step Two Returns To Inventory
    [Documentation]    Verify cancel at step two returns to inventory page
    [Tags]    cart    checkout
    Open Inventory Page
    Add First Item To Cart
    Open Cart
    Begin Checkout
    Fill Checkout Information    John    Smith    00000
    Cancel Checkout From Step Two
    Location Should Contain    inventory.html  # how this to be inventory.html i expect to be cart.html?
Cart Badge Persists Across Navigation
    [Documentation]    Verify cart badge persists after visiting product detail and back
    [Tags]    cart    navigation
    Open Inventory Page
    Add First Item To Cart
    Element Text Should Be    ${CART_BADGE}    1
    Open First Product Details
    Back To Inventory
    Element Text Should Be    ${CART_BADGE}    1
