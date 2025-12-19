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

# Cart & checkout extras
${CONTINUE_SHOPPING_BUTTON}    id=continue-shopping
${CANCEL_BUTTON}               id=cancel

# Product list helpers
${FIRST_ITEM_NAME}             xpath=(//div[@class='inventory_item']//div[@class='inventory_item_name'])[1]
${EXPECTED_FIRST_AZ}           Sauce Labs Backpack
${EXPECTED_FIRST_ZA}           Test.allTheThings() T-Shirt (Red)
${EXPECTED_FIRST_LOHI}         Sauce Labs Onesie
${EXPECTED_FIRST_HILO}         Sauce Labs Fleece Jacket
${FIRST_PRODUCT_IMAGE_LINK}    id=item_4_img_link

# Footer social links
${TWITTER_LINK}                css=.social_twitter
${FACEBOOK_LINK}               css=.social_facebook
${LINKEDIN_LINK}               css=.social_linkedin

# Overview totals and price/count locators
${SUMMARY_SUBTOTAL}            css=.summary_subtotal_label
${SUMMARY_TAX}                 css=.summary_tax_label
${SUMMARY_TOTAL}               css=.summary_total_label
${FIRST_ITEM_PRICE}            xpath=(//div[@class='inventory_item']//div[@class='inventory_item_price'])[1]
${INVENTORY_ITEM_NAME_ALL}     css=.inventory_item_name
${EXPECTED_PRICE_LOHI_FIRST}   $7.99
${OVERVIEW_FIRST_ITEM_PRICE}   xpath=(//div[@class='inventory_item_price'])[1]
${OVERVIEW_ITEM_NAME_ALL}      css=.cart_list .inventory_item_name

# External domains
${TWITTER_DOMAIN}              twitter.com
${FACEBOOK_DOMAIN}             facebook.com
${LINKEDIN_DOMAIN}             linkedin.com
