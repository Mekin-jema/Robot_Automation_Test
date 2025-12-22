*** Settings ***
Library    SeleniumLibrary






*** Variables ***
${URL}     https://www.saucedemo.com/
*** Test Cases ***
Correct Email And Password
    [Documentation]     fsfhksdhfkhkdsfhfsfjslkajflsjlfjlsdjf
    Open Browser     ${URL}    chrome
    Input Text      id=user-name    Mekin Jemal
    Input Password    id=password    MY-PASSWORD
    Click Button     id=login-button
    Close Browser


*** Keywords *** 