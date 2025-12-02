*** Settings ***
Documentation    Resource file for Shoes products on Amazon

Library    SeleniumLibrary

*** Variables ***
${SEARCH_BOX}       twotabsearchtextbox
${SEARCH_BUTTON}    nav-search-submit-button
${PRODUCT_LIST}     .s-main-slot

*** Keywords ***
Search For Shoes
    Input Text      id=${SEARCH_BOX}    Shoes
    Click Button    id=${SEARCH_BUTTON}
    Wait Until Page Contains Element    css=${PRODUCT_LIST}

Verify Shoes Products Are Displayed
    Element Should Be Visible    css=${PRODUCT_LIST}
    ${products}=    Get WebElements    css=${PRODUCT_LIST} .s-result-item
    
Sort through High to Low Priced Products
    [Documentation]    Sort the displayed Shoes products from high to low price
    Click Element    class=a-dropdown-label
    Click Element    xpath=//a[text()='Price: High to Low']
    Wait Until Page Contains Element    css=${PRODUCT_LIST}
    Sleep    3s

Get Top 3 Expensive Shoes Products
    [Documentation]    Retrieve the top 3 most expensive Shoes products
    ${products}=    Get WebElements    css=${PRODUCT_LIST} .s-result-item
    Log To Console    Top 3 Expensive Shoes Products:
    FOR    ${index}    IN RANGE    0    3
        ${position}=    Evaluate    ${index}+1
        ${product_name}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//h2/span
        ${product_price}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//span[@class='a-price-whole']
        ${product_rating}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//span[@class='a-size-small a-color-base']
        Log To Console    ${position}. ${product_name} - Price: ₹${product_price}
        Log To Console    Rating: ${product_rating}
    END