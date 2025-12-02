*** Settings ***
Documentation    Resource file for Shoes products on Amazon

Library    SeleniumLibrary

Resource   ../Resources/Shoes.resource
Resource   ../Resources/Common.resource

Suite Setup       Open Browser To Amazon Home Page
Suite Teardown    Run Keywords    Delete All Cookies    Close All Browsers

*** Test Cases ***
Verify Shoes Product Availability
    [Documentation]    Verify that Shoes products are available on Amazon
    Search For Shoes
    Verify Shoes Products Are Displayed
    Sort through High to Low Priced Products
    Page Scroll Down
    Page Scroll Up
    Get Top 3 Expensive Shoes Products
