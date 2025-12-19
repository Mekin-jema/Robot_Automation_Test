*** Settings ***
Documentation     External links navigation tests for SauceDemo
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ External Links Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Navigate To About And Back
    [Documentation]    Verify navigating to About then back
    [Tags]    menu    external
    Open Inventory Page
    Navigate To About
    Location Should Contain    saucelabs.com
    Go Back
    Title Should Be    Swag Labs
