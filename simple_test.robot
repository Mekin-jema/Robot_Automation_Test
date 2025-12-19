*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.saucedemo.com/

*** Test Cases ***
Valid Login Test
    [Documentation]  Test to verify valid login functionality
    Open Browser  ${URL}  chrome
    Input Text  id=user-name  standard_user
    Input Text  id=password  secret_sauce
    Click Button  id=login-button
    Wait Until Page Contains Element  xpath=//div[@class='inventory_list']  timeout=10s
    Capture Page Screenshot  output/valid_login_test.png
    [Teardown]  Close Browser

Invalid Login Test
    [Documentation]  Test to verify invalid login functionality
    Open Browser  ${URL}  chrome
    Input Text  id=user-name  invalid_user
    Input Text  id=password  wrong_password
    Click Button  id=login-button
    Wait Until Page Contains Element  xpath=//h3[@data-test='error']  timeout=10s
    Capture Page Screenshot  output/invalid_login_test.png
    [Teardown]  Close Browser
Empty Credentials Test
    [Documentation]  Test to verify login with empty credentials
    Open Browser  ${URL}  chrome
    Click Button  id=login-button
    Wait Until Page Contains Element  xpath=//h3[@data-test='error']  timeout=10s
    Capture Page Screenshot  output/empty_credentials_test.png
    [Teardown]  Close Browser
Locked Out User Test
    [Documentation]  Test to verify locked out user cannot login    
    Open Browser  ${URL}  chrome
    Input Text  id=user-name  locked_out_user
    Input Text  id=password  secret_sauce
    Click Button  id=login-button    
    Wait Until Page Contains Element  xpath=//h3[@data-test='error']  timeout=10s
    Capture Page Screenshot  output/locked_out_user_test.png        

*** Keywords ***
    [Teardown]  Close Browser
