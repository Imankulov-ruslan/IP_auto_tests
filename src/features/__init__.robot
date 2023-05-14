*** Settings ***
Suite Setup      Run Keywords
...    Set Global Variables    AND
...    Set Screenshot Directory    reports/screenshots
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${BROWSER} =  headlesschrome
${PAGE_OBJECTS_PATH} =  ${EXECDIR}${/}src${/}lib${/}page-objects
${PAGE_COMPONENTS_PATH} =  ${EXECDIR}${/}src${/}lib${/}page-components
${GENERIC_LOCATORS_PATH} =  ${EXECDIR}${/}src${/}lib${/}page-objects${/}generic-locators.py
${GENERIC_BDD_PAGE_ACTIONS_PATH} =  ${EXECDIR}${/}src${/}lib${/}page-objects${/}generic-bdd-actions.resource
${GENERIC_PAGE_ACTIONS_PATH} =  ${EXECDIR}${/}src${/}lib${/}page-objects${/}generic-actions.resource
${TIMEOUTS_PATH} =  ${EXECDIR}${/}src${/}config${/}timeouts${/}timeouts.yaml
${CONSTANTS_PATH} =  ${EXECDIR}${/}src${/}lib${/}constants
${LIBRARIES_PATH} =  ${EXECDIR}${/}src${/}lib${/}libraries

*** Keywords ***
Set Global Variables
    Set Global Variable    $BROWSER   ${BROWSER}
    Set Global Variable    $PAGE_OBJECTS_PATH   ${PAGE_OBJECTS_PATH}
    Set Global Variable    $PAGE_COMPONENTS_PATH   ${PAGE_COMPONENTS_PATH}
    Set Global Variable    $GENERIC_LOCATORS_PATH   ${GENERIC_LOCATORS_PATH}
    Set Global Variable    $GENERIC_BDD_PAGE_ACTIONS_PATH   ${GENERIC_BDD_PAGE_ACTIONS_PATH}
    Set Global Variable    $GENERIC_PAGE_ACTIONS_PATH   ${GENERIC_PAGE_ACTIONS_PATH}
    Set Global Variable    $TIMEOUTS_PATH   ${TIMEOUTS_PATH}
    Set Global Variable    $CONSTANTS_PATH   ${CONSTANTS_PATH}
    Set Global Variable    $LIBRARIES_PATH   ${LIBRARIES_PATH}
    # Set Environment Variable    API_PASSWORD    ${API_PASSWORD}
    # Set Environment Variable    DB_PASSWORD    ${DB_PASSWORD}
    Set Environment Variable    LOGIN_URL    ${LOGIN_URL}