*** Settings ***
Documentation     Product detail and sorting tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Product Page Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Open Product Detail And Back
    [Documentation]    Verify opening product details and returning to inventory
    [Tags]    product    navigation
    Open Inventory Page
    Open First Product Details
    Page Should Contain Element    ${PRODUCT_TITLE}
    Back To Inventory
    Page Should Contain Element    ${INVENTORY_LIST}

Sort Products Z To A
    [Documentation]    Verify sorting changes product order
    [Tags]    sort    regression
    Open Inventory Page
    Sort Products    za
    Sleep    1s
    Page Should Contain Element    ${INVENTORY_LIST}

Add From Product Detail
    [Documentation]    Add an item from product detail page
    [Tags]    cart    product
    Open Inventory Page
    Open First Product Details
    Click Button    ${FIRST_ITEM_ADD_BUTTON}
    Click Element   ${CART_ICON}
    Page Should Contain Element    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    1
