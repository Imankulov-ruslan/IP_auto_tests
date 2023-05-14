*** Settings ***
#------------------------Import Resources files-------------------------------#
Resource    ${EXECDIR}${/}src${/}features${/}ui${/}setup.resource
Resource    ${EXECDIR}${/}src${/}features${/}ui${/}teardown.resource

Resource    ${LIBRARIES_PATH}${/}api-requests.robot
Resource    ${LIBRARIES_PATH}${/}db.robot

Resource    ${PAGE_COMPONENTS_PATH}${/}sidebar-actions.resource
Resource    ${PAGE_COMPONENTS_PATH}${/}footer-actions.resource
Resource    ${PAGE_COMPONENTS_PATH}${/}sidebar-actions.resource
Resource    ${PAGE_OBJECTS_PATH}${/}courses${/}courses-actions.resource
Resource    ${PAGE_OBJECTS_PATH}${/}course${/}course-actions.resource
Resource    ${PAGE_OBJECTS_PATH}${/}create-practice${/}create-practice-actions.resource

Resource    ${GENERIC_BDD_PAGE_ACTIONS_PATH}
Resource    ${GENERIC_PAGE_ACTIONS_PATH}

#------------------------Import Libraries-------------------------------#
Library     SeleniumLibrary

#------------------------Import Variables files-------------------------------#
Variables    ${GENERIC_LOCATORS_PATH}
Variables    ${CONSTANTS_PATH}${/}ui-colors.py
Variables    ${PAGE_OBJECTS_PATH}${/}create-practice${/}create-practice-locators.py


