*** Settings ***
Documentation    Resource file for Apple Macbook products on Amazon

Library    SeleniumLibrary

*** Variables ***
${SEARCH_BOX}       twotabsearchtextbox
${SEARCH_BUTTON}    nav-search-submit-button
${PRODUCT_LIST}     .s-main-slot

*** Keywords ***
Search For Apple Macbook
    Input Text      id=${SEARCH_BOX}    Apple Macbook
    Click Button    id=${SEARCH_BUTTON}
    Wait Until Page Contains Element    css=${PRODUCT_LIST}

Verify Apple Macbook Products Are Displayed
    Element Should Be Visible    css=${PRODUCT_LIST}
    ${products}=    Get WebElements    css=${PRODUCT_LIST} .s-result-item

Sort through High to Low Priced Products
    [Documentation]    Sort the displayed Apple Macbook products from high to low price
    Click Element    class=a-dropdown-label
    Click Element    xpath=//a[text()='Price: High to Low']
    Wait Until Page Contains Element    css=${PRODUCT_LIST}
    Sleep    3s

Get Top 3 Expensive Apple Macbook Products
    [Documentation]    Retrieve the top 3 most expensive Apple Macbook products
    ${products}=    Get WebElements    css=${PRODUCT_LIST} .s-result-item
    Log To Console    Top 3 Expensive Apple Macbook Products:
    FOR    ${index}    IN RANGE    0    3
        ${position}=    Evaluate    ${index}+1
        ${product_name}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//h2/span
        ${product_price}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//span[@class='a-price-whole']
        ${product_rating}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//span[@class='a-size-small a-color-base']
        Log To Console    ${position}. ${product_name} - Price: ₹${product_price}
        Log To Console    Rating: ${product_rating}
    END

Get Price for Apple Macbook at Position
    [Arguments]    ${position}
    [Documentation]    Get the price of the Apple Macbook product at the specified position in the search results
    ${product_price}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${position}]//span[@class='a-price-whole']
    Log To Console    Price of Apple Macbook at position ${position}: ₹${product_price}


Get Prices for Apple 2025 Macbook Pro Models
    [Documentation]    Retrieve prices for Apple 2025 Macbook Pro models
    Input Text      id=${SEARCH_BOX}    Apple 2025 Macbook Pro
    Click Button    id=${SEARCH_BUTTON}
    Wait Until Page Contains Element    css=${PRODUCT_LIST}
    Sleep    3s
    ${products}=    Get WebElements    css=${PRODUCT_LIST} .s-result-item
    ${count}=    Get Length    ${products}
    Log    Total Apple 2025 Macbook Pro products found: ${count}
    Log    Prices for Apple 2025 Macbook Pro Models:
    FOR    ${index}    IN RANGE    1    ${count}
        ${product_name}=     Get Text    xpath=(//div[@data-component-type='s-search-result'])[${index}]//h2/span
        ${product_price}=    Get Text    xpath=(//div[@data-component-type='s-search-result'])[${index}]//span[@class='a-price-whole']
        Log   ${index}. ${product_name} - Price: ₹${product_price}
    END