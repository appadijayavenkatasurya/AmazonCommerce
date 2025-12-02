*** Settings ***
Documentation    Test suite for Apple Macbook products on Amazon

Library    SeleniumLibrary

Resource         ../Resources/AppleMacbook.resource
Resource         ../Resources/Common.resource

Suite Setup       Open Browser To Amazon Home Page
Suite Teardown    Run Keywords    Delete All Cookies    Close All Browsers


*** Test Cases ***
Verify Apple Macbook Product Availability
    [Documentation]    Verify that Apple Macbook products are available on Amazon
    Search For Apple Macbook
    Verify Apple Macbook Products Are Displayed
    Sort through High to Low Priced Products
    Page Scroll Down
    Page Scroll Up
    Get Top 3 Expensive Apple Macbook Products
    Get Price for Apple Macbook at Position    2
    Get Prices for Apple 2025 Macbook Pro Models
    