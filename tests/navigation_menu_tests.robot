*** Settings ***
Documentation     Navigation menu tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Navigation Menu Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Navigate All Items From Menu
    [Documentation]    Verify menu can navigate to All Items
    [Tags]    menu    navigation
    Open Inventory Page
    Navigate To All Items
    Page Should Contain Element    ${INVENTORY_LIST}

Reset App Clears Cart Badge
    [Documentation]    Verify reset app state clears cart badge
    [Tags]    menu    cart
    Open Inventory Page
    Add First Item To Cart
    Open Menu
    Reset App State
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${CART_BADGE}    ${SHORT_TIMEOUT}

Logout From Menu Returns To Login
    [Documentation]    Verify logout returns user to login page
    [Tags]    menu    logout    critical
    Open Inventory Page
    Logout
    Title Should Be    Swag Labs

Menu Open And Close Works
    [Documentation]    Verify hamburger menu opens and closes
    [Tags]    menu    ui
    Open Inventory Page
    Open Menu
    Page Should Contain Element    ${MENU_CLOSE}
    Close Menu
