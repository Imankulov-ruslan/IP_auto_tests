*** Settings ***
Resource      ${EXECDIR}${/}src${/}features${/}all_imports.robot
Resource    ../../lib/page-objects/courses/courses-actions.resource

Suite Setup    Run Keywords
...    Open New Browser And Log Into Agona As A Teacher

Suite Teardown    Close All Opened Browsers

Test Setup    I Navigate Courses Page

*** Test Cases ***

Test_Case_1_Create_Review_Task
    [Tags]    Flowcell_View
    ${RANDOM_COURSE_NAME}    Generate Random String    length=10

    WHEN I Open "ку" Course
    AND I Open Practical Tasks Tab
    AND I Click Create Practical Task Button
    WHEN I Choose First Value In "${THEME_FIELD}" Dropdown
    AND I Enter "${RANDOM_COURSE_NAME}" To "${NAME_FIELD}"
    AND I Set The Task Deadline In Future
    WHEN I Enter "1" To "${MAXIMUM_POINTS_FIELD}"
    WHEN I Choose Third Value In "${TASK_TYPE_FIELD}" Dropdown
    AND I Enter "test description" To "${DESCRIPTION_FIELD}"
    AND I Click "${SAVE_BUTTON}"
    THEN I See Course Page Contains "${RANDOM_COURSE_NAME}" Task

Test_Case_2_Review_Task_Maximum_Points
    [Tags]    Flowcell_View
    ${RANDOM_COURSE_NAME}    Generate Random String    length=10

    WHEN I Open "ку" Course
    AND I Open Practical Tasks Tab
    AND I Click Create Practical Task Button
    AND I Choose First Value In "${THEME_FIELD}" Dropdown
    AND I Enter "${RANDOM_COURSE_NAME}" To "${NAME_FIELD}"
    THEN I Set The Task Deadline In Future
    WHEN I Choose Third Value In "${TASK_TYPE_FIELD}" Dropdown
    AND I Enter "6" To "${MAXIMUM_POINTS_FIELD}"
    AND Press Keys    ${MAXIMUM_POINTS_FIELD}    TAB
    THEN I See "${ERROR_MESSAGE}" Appears
    THEN I See "${ERROR_MESSAGE}" Has A "Вознаграждение не может превышать 5 баллов"
    WHEN I Enter "5" To "${MAXIMUM_POINTS_FIELD}"
    THEN I See "${ERROR_MESSAGE}" Dissapears
    WHEN I Enter "test description" To "${DESCRIPTION_FIELD}"
    AND I Click "${SAVE_BUTTON}"
    THEN I See Course Page Contains "${RANDOM_COURSE_NAME}" Task

Test_Case_3_Delete_Review_Task
    [Tags]    Flowcell_View
    ${RANDOM_COURSE_NAME}    Generate Random String    length=10

    WHEN I Open "ку" Course
    AND I Open Practical Tasks Tab
    AND I Click Create Practical Task Button
    AND I Choose First Value In "${THEME_FIELD}" Dropdown
    AND I Enter "${RANDOM_COURSE_NAME}" To "${NAME_FIELD}"
    AND I Set The Task Deadline In Future
    AND I Enter "1" To "${MAXIMUM_POINTS_FIELD}"
    AND I Choose Third Value In "${TASK_TYPE_FIELD}" Dropdown
    AND I Enter "test description" To "${DESCRIPTION_FIELD}"
    AND I Click "${SAVE_BUTTON}"
    THEN I See Course Page Contains "${RANDOM_COURSE_NAME}" Task
    WHEN I Delete ${RANDOM_COURSE_NAME} Practical Task
    THEN I See Course Page Does Not Contain "${RANDOM_COURSE_NAME}" Task