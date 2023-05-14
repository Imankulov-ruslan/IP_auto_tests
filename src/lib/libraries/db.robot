*** Settings ***
Library  DatabaseLibrary

*** Keywords ***
Connect DB
    [Tags]    robot:private
    Connect To Database  psycopg2  ${db_name}  ${db_user}  ${db_password}  ${db_host}  ${db_port}

Disconnect DB
    [Tags]    robot:private
    Disconnect From Database
