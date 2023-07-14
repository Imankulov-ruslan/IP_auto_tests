*** Settings ***
Resource      ${EXECDIR}${/}src${/}features${/}all_imports.robot
Resource    ../../lib/page-objects/courses/courses-actions.resource

Suite Setup    Run Keywords
...    Open New Browser And Log Into Agona As A Teacher

Suite Teardown    Close All Opened Browsers

Test Setup    I Navigate Courses Page

*** Test Cases ***

Test_Case_1_Course_Copying_Name_Validation
    [Tags]    course_copy
    ${RANDOM_COURSE_NAME}    Generate Random String    length=10

    I Open "ку" Course
    I Open Practical Tasks Tab
    I Click Create Practical Task Button
    I Choose First Value In "${THEME_FIELD}" Dropdown
    I Enter "${RANDOM_COURSE_NAME}" To "${NAME_FIELD}"
    I Set The Task Deadline In Future
    I Choose Third Value In "${TASK_TYPE_FIELD}" Dropdown
    I Enter "6" To "${MAXIMUM_POINTS_FIELD}"
    Press Keys    ${MAXIMUM_POINTS_FIELD}    TAB
    I See "${ERROR_MESSAGE}" Appears
    I See "${ERROR_MESSAGE}" Has A "Вознаграждение не может превышать 5 баллов"
    I Enter "5" To "${MAXIMUM_POINTS_FIELD}"
    I See "${ERROR_MESSAGE}" Dissapears
    I Enter "test description" To "${DESCRIPTION_FIELD}"
    I Click "${SAVE_BUTTON}"
    I See Course Page Contains "${RANDOM_COURSE_NAME}" Task

# Test_Case_3_Delete_Review_Task
#     [Tags]    Flowcell_View
#     ${RANDOM_COURSE_NAME}    Generate Random String    length=10

#     I Open "ку" Course
#     I Open Practical Tasks Tab
#     I Click Create Practical Task Button
#     I Choose First Value In "${THEME_FIELD}" Dropdown
#     I Enter "${RANDOM_COURSE_NAME}" To "${NAME_FIELD}"
#     I Set The Task Deadline In Future
#     I Enter "1" To "${MAXIMUM_POINTS_FIELD}"
#     I Choose Third Value In "${TASK_TYPE_FIELD}" Dropdown
#     I Enter "test description" To "${DESCRIPTION_FIELD}"
#     I Click "${SAVE_BUTTON}"
#     I See Course Page Contains "${RANDOM_COURSE_NAME}" Task
#     I Delete ${RANDOM_COURSE_NAME} Practical Task
#     I See Course Page Does Not Contain "${RANDOM_COURSE_NAME}" Task