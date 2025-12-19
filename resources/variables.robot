*** Variables ***
# Application URL
${URL}        https://www.saucedemo.com/

# Browser Configuration
${BROWSER}    chrome
${SELENIUM_SPEED}    0.7s

# Valid User Credentials
${VALID_USER}     standard_user
${VALID_PASS}     secret_sauce

# Invalid User Credentials
${INVALID_USER}   invalid_user
${INVALID_PASS}   wrong_password

# Locked Out User
${LOCKED_USER}    locked_out_user

# Timeouts
${DEFAULT_TIMEOUT}    10s
${SHORT_TIMEOUT}      5s

# Locators
${LOGIN_USERNAME_FIELD}    id=user-name
${LOGIN_PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}            id=login-button
${ERROR_MESSAGE}           xpath=//h3[@data-test='error']
${INVENTORY_LIST}          xpath=//div[@class='inventory_list']
# This variables are specific to inventory and checkout tests
${CART_ICON}               css=a.shopping_cart_link
${CART_BADGE}              css=.shopping_cart_badge
${FIRST_ITEM_ADD_BUTTON}   xpath=(//button[contains(@data-test,'add-to-cart')])[1]
${FIRST_ITEM_REMOVE_BUTTON}    xpath=(//button[contains(@data-test,'remove')])[1]
${CHECKOUT_BUTTON}         id=checkout
${CONTINUE_BUTTON}         id=continue
${FINISH_BUTTON}           id=finish
${FIRST_NAME_FIELD}        id=first-name
${LAST_NAME_FIELD}         id=last-name
${POSTAL_CODE_FIELD}       id=postal-code
${ORDER_CONFIRM_TEXT}      xpath=//h2[contains(.,'THANK YOU')]

# Product and navigation locators
${FIRST_PRODUCT_LINK}      id=item_4_title_link
${PRODUCT_TITLE}           css=.inventory_details_name
${BACK_TO_PRODUCTS}        id=back-to-products
${SORT_SELECT}             css=.product_sort_container
${MENU_BUTTON}             id=react-burger-menu-btn
${MENU_CLOSE}              id=react-burger-cross-btn
${MENU_ALL_ITEMS}          id=inventory_sidebar_link
${MENU_ABOUT}              id=about_sidebar_link
${MENU_LOGOUT}             id=logout_sidebar_link
${MENU_RESET}              id=reset_sidebar_link
