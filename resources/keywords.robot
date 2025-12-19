*** Settings ***
Library           SeleniumLibrary
Resource          variables.robot

Documentation     Common keywords for SauceDemo flows


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

Initialize Suite
    [Documentation]    Sets Selenium speed and default timeout for visibility
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Set Selenium Speed      ${SELENIUM_SPEED}
    Log To Console    \n⏱️ Selenium speed set to ${SELENIUM_SPEED}

# Inventory and checkout flows
Open Inventory Page
    [Documentation]    Opens the login page and signs in with valid user to inventory
    Login As Valid User

Add First Item To Cart
    [Documentation]    Adds the first listed item to cart and verifies badge
    Click Button    ${FIRST_ITEM_ADD_BUTTON}
    Wait Until Page Contains Element    ${CART_BADGE}    timeout=${SHORT_TIMEOUT}
    Element Text Should Be    ${CART_BADGE}    1

Open Cart
    [Documentation]    Opens the cart page
    Click Element    ${CART_ICON}
    Wait Until Location Contains    cart.html    timeout=${SHORT_TIMEOUT}

Remove First Item From Cart
    [Documentation]    Removes the first item from the cart
    Click Button    ${FIRST_ITEM_REMOVE_BUTTON}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${CART_BADGE}    ${SHORT_TIMEOUT}

Begin Checkout
    [Documentation]    Starts checkout from cart page
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Location Contains    checkout-step-one.html    timeout=${SHORT_TIMEOUT}

Fill Checkout Information
    [Documentation]    Fills mandatory checkout fields
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}

Complete Checkout
    [Documentation]    Completes checkout and verifies confirmation
    Click Button    ${CONTINUE_BUTTON}
    Wait Until Location Contains    checkout-step-two.html    timeout=${SHORT_TIMEOUT}
    Click Button    ${FINISH_BUTTON}
    Wait Until Page Contains Element    ${ORDER_CONFIRM_TEXT}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain    THANK YOU

Open First Product Details
    [Documentation]    Opens the first product details page from inventory
    Click Element    ${FIRST_PRODUCT_LINK}
    Wait Until Location Contains    inventory-item.html    timeout=${SHORT_TIMEOUT}
    Page Should Contain Element    ${PRODUCT_TITLE}

Back To Inventory
    [Documentation]    Returns to inventory list from product details
    Click Button    ${BACK_TO_PRODUCTS}
    Wait Until Location Contains    inventory.html    timeout=${SHORT_TIMEOUT}

Sort Products
    [Documentation]    Sorts products by provided value (az, za, lohi, hilo)
    [Arguments]    ${sort_value}
    Select From List By Value    ${SORT_SELECT}    ${sort_value}
    Sleep    0.5s

Open Menu
    [Documentation]    Opens the hamburger side menu
    Click Button    ${MENU_BUTTON}
    Wait Until Page Contains Element    ${MENU_CLOSE}    timeout=${SHORT_TIMEOUT}

Close Menu
    [Documentation]    Closes the hamburger side menu
    Click Button    ${MENU_CLOSE}

Navigate To All Items
    [Documentation]    Navigates to inventory via menu
    Open Menu
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Location Contains    inventory.html    timeout=${SHORT_TIMEOUT}

Navigate To About
    [Documentation]    Navigates to Sauce Labs About page
    Open Menu
    Click Element    ${MENU_ABOUT}
    Wait Until Location Contains    saucelabs.com    timeout=${DEFAULT_TIMEOUT}

Logout
    [Documentation]    Logs out via hamburger menu
    Open Menu
    Click Element    ${MENU_LOGOUT}
    Wait Until Location Contains    /    timeout=${SHORT_TIMEOUT}
    Title Should Be    Swag Labs

Reset App State
    [Documentation]    Resets app state (clears cart)
    Open Menu
    Click Element    ${MENU_RESET}
    Sleep    0.5s
