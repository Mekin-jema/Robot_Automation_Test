*** Settings ***
Documentation     Sorting tests for SauceDemo inventory
Resource          ../resources/keywords.robot

Suite Setup       Initialize Suite
Suite Teardown    Log To Console    \n✅ Sorting Suite Completed
Test Teardown     Close Browser Session

Metadata          Version         1.0
Metadata          Author          QA Team
Metadata          Date            2025-12-19


*** Test Cases ***
Sort A To Z Shows Backpack First
    [Documentation]    Verify A→Z sort puts Backpack first
    [Tags]    sort    az
    Open Inventory Page
    Sort Products    az
    Verify First Item Name Is    ${EXPECTED_FIRST_AZ}

Sort Z To A Shows Red T-Shirt First
    [Documentation]    Verify Z→A sort puts Red T-Shirt first
    [Tags]    sort    za
    Open Inventory Page
    Sort Products    za
    Verify First Item Name Is    ${EXPECTED_FIRST_ZA}

Sort Low To High Shows Onesie And Price
    [Documentation]    Verify Low→High sort shows Onesie first with price
    [Tags]    sort    lohi
    Open Inventory Page
    Sort Products    lohi
    Verify First Item Name Is    ${EXPECTED_FIRST_LOHI}
    Verify First Item Price Is    ${EXPECTED_PRICE_LOHI_FIRST}

Sort High To Low Shows Fleece Jacket First
    [Documentation]    Verify High→Low sort puts Fleece Jacket first
    [Tags]    sort    hilo
    Open Inventory Page
    Sort Products    hilo
    Verify First Item Name Is    ${EXPECTED_FIRST_HILO}
