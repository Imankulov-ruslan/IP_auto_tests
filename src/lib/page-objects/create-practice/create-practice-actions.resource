*** Settings ***
Library    SeleniumLibrary
Resource    ${GENERIC_BDD_PAGE_ACTIONS_PATH}
Resource    ${GENERIC_PAGE_ACTIONS_PATH}
Variables    ${GENERIC_LOCATORS_PATH}
Variables    create-practice-locators.py

*** Keywords ***
I Am Redirected To Course Page
    Wait Until Element Visible And Enable    ${MAIN_VIEW}
    Wait Until Element Visible And Enable    ${COURSE_CARD}
    Assert Page URL    ${base_url}/courses/

I Set The Task Deadline In Future
    generic-actions.Click Button    ${DEADLINE_FIELD}
    generic-actions.Click Button    css:button.tk-calendar-month__day--today+button