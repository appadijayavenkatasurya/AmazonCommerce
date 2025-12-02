*** Settings ***
Documentation    Resource file for Shoes products on Amazon

Library    SeleniumLibrary

*** Variables ***
${AMAZON_URL}    https://www.amazon.in/
${BROWSER}    chrome

*** Keywords ***
Open Browser To Amazon Home Page
    Open Browser    ${AMAZON_URL}    chrome
    Maximize Browser Window

Page Scroll Down
    [Documentation]    Scroll down the page to load more products
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s

Page Scroll Up
    [Documentation]    Scroll up the page to the top
    Execute JavaScript    window.scrollTo(0, 0);
    Sleep    2s
