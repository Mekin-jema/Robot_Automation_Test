*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${URL}     https://www.saucedemo.com/

*** Test Cases ***
Valid Login Test
    [Documentation]    Test to Verify  Valid Login Test
    Open Browser    ${URL}  chrome
    Input Text  id=user-name  Mekin_Jemal
    Input Text  id=password     secret_sauce
    Click Button  id=login-button



Invalid Login Test
    [Documentation]  Test to Invalid Login Test
    Open Browser  ${URL}     chrome
    Input Text    id=input-text  Mekin Jemal 
    Input Password  id=password  12345
    Click Button  id= my-button
Empty Credentials Test
    [Documentation]  Test to Empty Credential 
    Open Browser    ${URL}  chrome
    Input Text    id=user-name  Mekin
    Input Password  id=password  my-password
    Click Button  id=login
Locked Out User Test
    [Documentation]  Test Locked Out User Test
    Open Browser  ${URL}   chrome
    Input Text    id=my-name  Mekin Jemal
    Input Password  id=my-password  password
Strong Passowrd Test
    [Documentation]  Test Strong Password Test
    Open Browser  ${URL}   chrome
    Input Text    id=my-name  Mekin Jemal
    Input Password  id=my-password  P@ssw0rd123!    

*** Keywords ***