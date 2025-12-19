*** Settings ***
Documentation     Footer social links tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Footer Links Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Footer Links Are Visible On Inventory
    [Documentation]    Verify social links show on inventory page
    [Tags]    footer    smoke
    Open Inventory Page
    Verify Footer Links Present

Footer Links Persist On Product Detail
    [Documentation]    Verify social links show on product detail page
    [Tags]    footer    regression
    Open Inventory Page
    Open First Product Details
    Verify Footer Links Present

Twitter Link Opens Correct Domain
    [Documentation]    Verify Twitter link opens twitter.com in new tab
    [Tags]    footer    external
    Open Inventory Page
    Open External Link And Verify Domain    ${TWITTER_LINK}    ${TWITTER_DOMAIN}

Facebook Link Opens Correct Domain
    [Documentation]    Verify Facebook link opens facebook.com in new tab
    [Tags]    footer    external
    Open Inventory Page
    Open External Link And Verify Domain    ${FACEBOOK_LINK}    ${FACEBOOK_DOMAIN}

LinkedIn Link Opens Correct Domain
    [Documentation]    Verify LinkedIn link opens linkedin.com in new tab
    [Tags]    footer    external
    Open Inventory Page
    Open External Link And Verify Domain    ${LINKEDIN_LINK}    ${LINKEDIN_DOMAIN}
