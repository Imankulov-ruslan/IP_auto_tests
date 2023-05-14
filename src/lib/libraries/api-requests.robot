*** Settings ***
Library    RequestsLibrary
Library    auth.py
Library    Collections
Library    String

*** Keywords ***
Get View Count
    ${headers} =    Create Auth Header
    ${response} =    GET    ${api_url}/view-count    headers=${headers}
    Request Should Be Successful    ${response}
    [Return]    ${response.json()}