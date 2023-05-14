*** Settings ***
Library    SeleniumLibrary
Resource    ${GENERIC_BDD_PAGE_ACTIONS_PATH}
Resource    ${GENERIC_PAGE_ACTIONS_PATH}
Variables    ${GENERIC_LOCATORS_PATH}
Variables    course-locators.py

*** Keywords ***
I Am Redirected To Course Page
    Wait Until Element Visible And Enable    ${MAIN_VIEW}
    Wait Until Element Visible And Enable    ${COURSE_CARD}
    Assert Page URL    ${base_url}/courses/

I Open Practical Tasks Tab
    generic-actions.Click Button    ${PRACTICAL_TASKS_LINK}

I Click Create Practical Task Button
    generic-actions.Click Button    ${CREATE_PRACTICE_BUTTON}

I See Course Page Contains "${task_name}" Task
    Wait Until Keyword Succeeds    10s    1s    Assert Course Page Contains "${task_name}" Task

I See Course Page Does Not Contain "${task_name}" Task
    Wait Until Keyword Succeeds    10s    1s    Assert Course Page Does Not Contain "${task_name}" Task

Assert Course Page Contains "${task_name}" Task
    ${tasks_name} =    Get Text Content From All Elements    ${PRACTICE_CARD} h4
    Should Contain Any    ${tasks_name}    ${task_name}

Assert Course Page Does Not Contain "${task_name}" Task
    ${tasks_name} =    Get Text Content From All Elements    ${PRACTICE_CARD} h4
    Should Not Contain Any    ${tasks_name}    ${task_name}

I Delete ${task_name} Practical Task
    Wait Until Page Contains Element    ${PRACTICE_CARD}
    ${task_names} =    Get Text Content From All Elements    ${PRACTICE_CARD} h4
    ${task_index} =    Get Index From List    ${task_names}    ${task_name}
    Mouse Over    ${PRACTICE_CARD}:nth-child(${${task_index}+1})
    generic-actions.Click Button    ${PRACTICE_CARD}:nth-child(${${task_index}+1}) agn-card button:nth-child(2)
    Sleep    6