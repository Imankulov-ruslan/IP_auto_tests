*** Settings ***
Library    SeleniumLibrary
Resource    ${PAGE_OBJECTS_PATH}${/}login/login-actions.resource

*** Keywords ***
Open New Browser And Log Into Agona As A Admin
    Open New Browser
    I Log Into Agona    ${ui_auth_admin_username}    ${ui_auth_password}

Open New Browser And Log Into Agona As A Teacher
    Open New Browser
    I Log Into Agona    ${ui_auth_teacher_username}    ${ui_auth_password}

Open New Browser And Log Into Agona As A Student
    Open New Browser
    I Log Into Agona    ${ui_auth_student_username}    ${ui_auth_password}

Open New Browser
    Open Browser    ${ui_auth.base_url}/${ui_auth.urn}    ${BROWSER}    options=add_argument("--no-sandbox");add_argument("--start-maximized");add_argument("window-size=3840,2160");add_argument("--disable-gpu");add_argument("--disable-extensions");add_argument("--disable-dev-shm-usage")
    
