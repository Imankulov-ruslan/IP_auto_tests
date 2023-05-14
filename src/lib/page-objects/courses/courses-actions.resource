*** Settings ***
Library    SeleniumLibrary
Resource    ${GENERIC_BDD_PAGE_ACTIONS_PATH}
Resource    ${GENERIC_PAGE_ACTIONS_PATH}
Variables    ${GENERIC_LOCATORS_PATH}

*** Keywords ***
I Am Redirected To Teacher Courses Page
    Wait Until Element Visible And Enable    ${MAIN_VIEW}
    Assert Page URL    ${ui_courses_teacher.base_url}/${ui_courses_teacher.urn}

I Open "${course_name}" Course
    Wait Until Page Contains Element    ${COURSE_CARD}
    ${course_names} =    Get Text Content From All Elements    ${COURSE_CARD} h3
    ${course_index} =    Get Index From List    ${course_names}    ${course_name}
    generic-actions.Click Button    ${COURSE_CARD}:nth-child(${${course_index}+1})

I Navigate Courses Page
    Go To    ${ui_courses_teacher.base_url}/${ui_courses_teacher.urn}