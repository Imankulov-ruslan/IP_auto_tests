*** Settings ***
Library    SeleniumLibrary
Variables    footer-locators.py

*** Keywords ***
I See The Footer On The Bottom
    Element Should Be Visible    ${FOOTER}
    ${footer_position} =    Execute Javascript    return document.querySelector('footer').getBoundingClientRect().bottom
    ${document_height} =    Execute Javascript    return document.body.getBoundingClientRect().bottom
    Should Be Equal    ${footer_position}    ${document_height}
    