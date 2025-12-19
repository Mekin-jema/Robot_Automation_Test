*** Variables ***
# Application URL
${URL}        https://www.saucedemo.com/

# Browser Configuration
${BROWSER}    chrome

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
